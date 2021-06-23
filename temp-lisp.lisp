(defun urls-visited-over-threshold (threshold)
  "Return a pair '(number-of-visits URL) of all sites 
which were visited more times than the threshold."
  (let*
      ((history-entries-raw
         (with-data-unsafe (history (history-path (current-buffer)))
           (alex:hash-table-keys (htree:entries history))))
       (pair-frequency-url (mapcar #'(lambda (e) (list (implicit-visits (htree:data e))
                                                       (quri:uri-host (url (htree:data e)))
                                                       (title (htree:data e))))
                                   history-entries-raw)))
    (remove-if-not #'(lambda (e) (> (car e) threshold)) pair-frequency-url)))

(defun %list-bookmarks ()
  (mapcar #'(lambda (e) (quri:uri-host (url e)))
            (with-data-access (bookmarks (bookmarks-path (current-buffer)))
              bookmarks)))

(defun is-url-new-to-bookmarks (url)
  "Return NIL if URL is already bookmarked or
return the URL if it is new to the bookmark list."
  (let ((bookmarks-list (mapcar #'(lambda (e) (quri:uri-host (url e)))
                                (with-data-access (bookmarks (bookmarks-path (current-buffer)))
                                  bookmarks))))
    (if (member url bookmarks-list :test #'string=)
        nil
        url)))

(defun %bookmark-add-frequent-visited-url (url title)
  (bookmark-add (quri:uri url) :title title))

(defun glue-together ()
  (dolist (x  (urls-visited-over-threshold 10))
    (format t "~&~S" x)
    (if (is-url-new-to-bookmarks (second x)) (%bookmark-add-frequent-visited-url (second x) (third x)))))

(defun draft ()         
  (defun aux (url-left)
    (cond ((null url-left) nil)
          ((is-url-new-to-bookmarks (first url-left)) (cons (first url-left)
                                                            (aux (rest url-left))))
          (t (aux (cdr url-left)))))
  (aux (mapcar #'second (urls-visited-over-threshold 1))))
