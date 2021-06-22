+(defun list-urls-visited-over-threshold (threshold)
+  "Returns a pair '(number-of-visits URL) of all sites 
+which were visited more times than the threshold."
+  (let*
+      ((history-entries-raw
+          (with-data-unsafe (history (history-path (current-buffer)))
+            (alex:hash-table-keys (htree:entries history))))
+      (pair-frequency-url (mapcar #'(lambda (e)
+                                  (list (implicit-visits (htree:data e))
+                                        (quri:uri-host (url (htree:data e)))))
+                                  history-entries-raw)))
+    (remove-if-not #'(lambda (e) (> (car e) threshold)) pair-frequency-url)))
+
+(defun is-url-bookmarked (url) ;botar depois url como parameter
+  "documentation"
+  (let ((bookmarks-list (mapcar #'(lambda (e) (quri:uri-host (url e)))
+                                 (with-data-access (bookmarks (bookmarks-path (current-buffer)))
+                                   bookmarks))))
+    (car (member url bookmarks-list :test #'string=))))
+
+;falta essa parte, uma função que FILTRA, outro REMOVE-IF-NOT!!!
+(defun %add-frequent-urls-non-bookmarked-yet ()
+  (defun aux (frequent-urls-left accu)
+    (cond ((null frequent-urls-left) accu)
+          ((is-url-bookmarked (second (car frequent-urls-left)))
+           (cons (second (car frequent-urls-left)) accu))
+          (t (aux (cdr frequent-urls-left) accu))))
+  (aux (list-urls-visited-over-threshold 1) nil))
+
+;  (mapcar #'(lambda (e) (is-url-bookmarked (second e)))  (list-urls-visited-over-threshold 1))
