(define-parenscript %copy-placeholder ()
  (ps:chain document active-element placeholder))

(define-command copy-placeholder ()
  "Copy placeholder text to clipboard."
  (let ((current-value (%copy-placeholder)))
    (if (eq current-value :undefined)
        (echo "No active selected placeholder.")
        (progn (copy-to-clipboard current-value)
               (echo "Placeholder copied.")))))

(define-parenscript %get-input-data ()
  (let* ((x (ps:chain document (query-selector-all "input")))
         (len (ps:chain x length))
         (output ""))
    (dotimes (i len)
      (setf output (+ output "|new-input-field|"))
      (if (not (equal (ps:chain (aref x i) id) ""))
          (setf output (+ output "~" ":id" "~" (ps:chain  (aref x i) id) "~")))
      (if (not (equal (ps:chain (aref x i) name) ""))
          (setf output (+ output "~" ":name" "~" (ps:chain  (aref x i) name) "~"))) 
      (if (not (equal (ps:chain (aref x i) value) ""))
          (setf output (+ output "~" ":value" "~" (ps:chain  (aref x i) value) "~"))) 
      (if (not (equal (ps:chain (aref x i) type) ""))
          (setf output (+ output "~" ":type" "~" (ps:chain  (aref x i) type) "~"))))
    output))

(defun split-input-fields (str)
  (str:split "|new-input-field|" str :omit-nulls t))

(defun split-input-attributes (str)
  (str:split "~" str :omit-nulls t))

(defun list-input-data (str)
  (mapcar #'(lambda (e) (split-input-attributes e)) (split-input-fields str)))

(defun convert-string-to-keyword (string
                                  &key
                                  (upcase t)
                                  (max-string-length 100))
  (and (<= 2 (length string) max-string-length)
       (char= (char string 0) #\:)
       (let ((string1 (subseq string 1)))
         (when upcase
           (setf string1 (string-upcase string1)))
         (values (intern string1 "KEYWORD")))))

(defun convert-key-value-lists (lists)
  (loop for list in lists
        collect (loop for (key value) on list by #'cddr
                      collect (convert-string-to-keyword key)
                      collect value)))

(define-command save-input-data ()
  "Save HTML input data in a local file."
  (let* ((input-data-to-save
           (convert-key-value-lists (list-input-data (%get-input-data))))
         (date (nyxt::last-access (current-buffer)))
         (url (render-url (nyxt::url (current-buffer))))
         (data-to-save (cons (list :date date :url url) input-data-to-save)))
    (with-open-file (str "/home/pedro/miscellaneous/misc/tests-output/input-data.lisp"
                         :direction :output
                         :if-exists :supersede
                         :if-does-not-exist :create)
      (format str " ~S ~%" data-to-save))))

(defun %write-input-data ()
  (local-time:enable-read-macros)
  (let* ((stringfied-list (uiop:read-file-string
                          "/home/pedro/miscellaneous/misc/tests-output/input-data.lisp"))
         (string->list (read-from-string stringfied-list))
         (input-fields (rest string->list))
         (input-values (mapcar #'(lambda (e) (getf e :value "NIL")) input-fields)))
      input-values))

(define-parenscript ps-write-input-data ()
  (let* ((x (ps:chain document (query-selector-all "input")))
         (len (ps:chain x length))
         (saved_input_values (ps:lisp (cons 'ps:array (%write-input-data)))))
    (dotimes (i len)
      (setf (ps:chain (aref x i) value)
            (ps:chain (aref saved_input_values i))))))

(define-command write-saved-input-data ()
  "Fill the input fields with the saved answers."
  (ps-write-input-data))
