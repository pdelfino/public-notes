
(defun %urls-visited-over-threshold (threshold)
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

(defun %list-bookmarks ()  ; NOT WORKING WELL
  (mapcar #'(lambda (e) (quri:uri-host (url e)))
            (with-data-access (bookmarks (bookmarks-path (current-buffer)))
              bookmarks)))

(defun %is-url-new-to-bookmarks (url)
  "Return NIL if URL is already bookmarked or
return the URL if it is new to the bookmark list."
  (let ((bookmarks-list (mapcar #'(lambda (e) (quri:uri-host (url e)))
                                (with-data-access (bookmarks (bookmarks-path (current-buffer)))
                                  bookmarks))))
    (if (member url bookmarks-list :test #'string=)
        nil
        url)))

(defun %bookmark-add-a-frequent-visited-url (url title)
  (bookmark-add (quri:uri url) :title title))

(defun bookmark-frequently-visited-urls ()
  (dolist (url  (%urls-visited-over-threshold 10))
    (format t "~&~S" url)
    (if (%is-url-new-to-bookmarks (second url)) (%bookmark-add-a-frequent-visited-url (second url) (third url)))))

(define-command show-clipboard ()
  "Show the current clipboard."
  (echo (ring-insert-clipboard (clipboard-ring *browser*))))


;;;;;;;;;;;;;;;;


(defparameter *change-global-var* 20)
#+nil
(defun old%urls-visited-over-threshold (threshold)
  "Return a list '(number-of-visits url-instance url-title) 
of all URLs which were visited more times than the threshold."
  (let*
      ((history-entries-raw
         (with-data-unsafe (history (history-path (current-buffer)))
           (alex:hash-table-keys (htree:entries history))))
       (pair-frequency-url (mapcar #'(lambda (e) (list (implicit-visits (htree:data e))
                                                       (url (htree:data e))
                                                       (title (htree:data e))))
                                   history-entries-raw)))
    (remove-if-not #'(lambda (e) (> (first e) threshold)) pair-frequency-url)))

(defun %urls-visited-over-threshold (threshold)
  "Return a list '(number-of-visits url-instance url-title) 
of all URLs which were visited more times than the threshold."
  (let*
      ((history-entries-raw
         (with-data-unsafe (history (history-path (current-buffer)))
           (alex:hash-table-keys (htree:entries history))))
       (history-entries-above-threshold  
         (remove-if-not #'(lambda (e) (> (implicit-visits (htree:data e)) threshold))
                        history-entries-raw))
       (urls-frequently-visited
         (mapcar #'(lambda (e) (url (htree:data e))) history-entries-above-threshold)))
    urls-frequently-visited))

#+nil
(defun %list-bookmarks ()
  "List all instances of URLs currently bookmarked."
  (mapcar #'(lambda (e) (url e))
          (with-data-access (bookmarks (bookmarks-path (current-buffer)))
            bookmarks)))
#+nil
(defun %%concatenate-url (url-instance)
  "After receiving an instace of an URL, concatenate
scheme, host and path to form a fully complete URL address."
  (let ((scheme (quri:uri-scheme url-instance))
        (host   (quri:uri-host   url-instance))
        (path   (quri:uri-path   url-instance)))
    (concatenate 'string scheme "://" host path)))


(defun old%is-url-new-to-bookmarks-p (url-address)
  "Return NIL if URL address is already bookmarked or
return the URL's full address if it is new to the bookmark list."
  (let ((bookmarks-address-list (mapcar #'(lambda (e)  (render-url (url e)))
                                (with-data-access (bookmarks (bookmarks-path (current-buffer)))
                                  bookmarks)))) 
    (if (member url-address bookmarks-address-list :test #'string=)
        nil
        url-address)))


(defun %is-url-new-to-bookmarks-p (url-address)
  "Return NIL if URL address is already bookmarked or
return the URL's full address if it is new to the bookmark list."
  (find url-address
    (with-data-access (bookmarks (bookmarks-path (current-buffer)))
                      bookmarks)
     :test #'equalp
     :key (lambda (e) (render-url (url e)))))

(defun alter%is-url-new-to-bookmarks (url-address)
  )

#+nil
(defun %bookmark-a-frequently-visited-url (url-instance title-data)
  "Add an especific URL to the bookmark list."  ; (bookmark-add (quri:uri (car url-info-list)) :title title)
  (let* ((url-address (render-url url-instance))
         (tags (prompt
                :prompt "Tag(s)"
                :sources (list
                          (make-instance 'prompter:word-source
                                         :name "New tags"
                                         :multi-selection-p t)
                          (make-instance 'tag-source
                                         :marks (url-bookmark-tags url-instance))))))
    (bookmark-add  (quri:uri url-address) :title title-data :tags tags)))

#+nil
(defun old-bookmark-frequently-visited-urls ()
  "Add websites frequently visited that are not
included on the bookmarklist."
  (dolist (url-data  (%urls-visited-over-threshold (url->bookmark-visit-threshold *browser*)))
    (let* ((url-instance (second url-data))
           (url-address (render-url url-instance))
           ;(title        (third url-data))
           )
      (if (old%is-url-new-to-bookmarks-p url-address)
          (bookmark-url :url (render-url url-address))))))

(defun bookmark-frequently-visited-urls ()
  "Add websites frequently visited that are not
included on the bookmarklist."
  (dolist (url-instance  (%urls-visited-over-threshold (url->bookmark-visit-threshold *browser*)))
    (if (old%is-url-new-to-bookmarks-p (render-url url-instance))
        (bookmark-url :url (render-url url-instance)))))














 (define-parenscript mozinha () (ps:chain document  (query-selector-all "[rel=prev]") 0 (click)) )
