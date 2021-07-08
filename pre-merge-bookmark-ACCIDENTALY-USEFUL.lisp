
(defun bookmark-frequent-visit (history-entries-selected)
  "Add frequently visited URLs that are not included in the bookmarks.  The
   sample space of visited URLs is received as an argument and previously
   defined by the user. "
  (labels ((urls-visited-over-threshold (threshold)
             "The local function "`urls-visited-over-thresold" returns all URLs
             instances which were visited more times than the threshold."
             (let* ((history-entries-above-threshold
                      (remove-if-not #'(lambda (e) (> (implicit-visits e) threshold))
                                     history-entries-selected)))
               (mapcar #'(lambda (e) (url e)) history-entries-above-threshold)))
           (bookmarked-url-p (url)
             "The local function  "`bookmarked-url-p" returns the URL
            itself if it is new to the bookmark list and NIL if it is
            already there."
             (let ((bookmarks-address-list
                     (mapcar #'(lambda (e) (url e))
                             (with-data-unsafe (bookmarks (bookmarks-path (current-buffer)))
                               bookmarks))))
               (if (member url bookmarks-address-list :test #'quri:uri=)
                   nil
                   url))))
    (dolist (url (urls-visited-over-threshold (url->bookmark-visit-threshold *browser*)))
      (let ((url-address (render-url url)))
        (if (bookmarked-url-p url)
            (if-confirm ("Bookmark ~a?" url-address)
                        (bookmark-url :url url-address)))))))

(define-command bookmark-frequent-history-entries (&key (buffer (current-buffer)))
  "Prompts the user for history entries (the user can select them all), and then
call bookmark-frequent-visit over the selection."
  (let ((entries (prompt
                  :prompt "Select entries"
                  :sources (list (make-instance 'history-disowned-source
                                                :buffer buffer)))))
    (bookmark-frequent-visit entries)))
