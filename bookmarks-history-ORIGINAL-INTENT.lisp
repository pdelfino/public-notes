+(defun bookmarked-url-p (url-address)
+                  "The local function bookmarked-url-p returns the URL
+            address itself if it new to the bookmark list and NIL if it is
+            already there "
+                  (let ((bookmarks-address-list
+                          (mapcar #'(lambda (e) (render-url (url e)))
+                                  (with-data-unsafe (bookmarks (bookmarks-path (current-buffer)))
+                                    bookmarks))))
+                    (if (member url-address bookmarks-address-list :test #'string=)
+                        nil
+                        url-address)))
+
+(defun bookmark-frequent-visit ()
+  (let* ((history-entries
+           (with-data-unsafe (history (history-path (current-buffer)))
+             (mapcar #'htree:data (alex:hash-table-keys (htree:entries history)))))
+         (current-url
+           (find (url (current-buffer)) history-entries
+                                        :test #'equalp
+                                        :key #'url))
+         (implicit-visits-value
+           (implicit-visits current-url)))
+      implicit-visits-value))
+
