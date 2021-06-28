(define-bookmarklet-command go-next
  "Navigate to the next element according to the HTML rel attribute."
  "(function() {(document.querySelectorAll('[rel=\"next\"]'))[0].click()})();")

(define-bookmarklet-command go-previous
  "Navigate to the previous element according to the HTML rel attribute."
  "(function() {(document.querySelectorAll('[rel=\"prev\"]'))[0].click()})();")
