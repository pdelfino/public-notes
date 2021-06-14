
(define-command show-clipboard ()
  "Shows the current clipboard."
  (echo (ring-insert-clipboard (nyxt::clipboard-ring *browser*))))
