(DEFINE-CONFIGURATION (BUFFER WEB-BUFFER)
  ((DEFAULT-MODES (APPEND '(EMACS-MODE) %SLOT-DEFAULT%))))
(DEFINE-CONFIGURATION BUFFER
  ((CURRENT-ZOOM-RATIO 10)))
(DEFINE-CONFIGURATION STATUS-BUFFER
  ((HEIGHT 24)))
(DEFINE-CONFIGURATION (BUFFER WEB-BUFFER)
  ((DEFAULT-MODES (APPEND '(EMACS-MODE) %SLOT-DEFAULT%))))
(DEFINE-CONFIGURATION (BUFFER WEB-BUFFER)
  ((DEFAULT-MODES %SLOT-DEFAULT%)))
(DEFINE-CONFIGURATION (BUFFER WEB-BUFFER)
  ((DEFAULT-MODES (APPEND '(EMACS-MODE) %SLOT-DEFAULT%))))
(DEFINE-CONFIGURATION (BUFFER WEB-BUFFER)
  ((DEFAULT-MODES %SLOT-DEFAULT%)))
  
(define-bookmarklet-command hack-youtube-speed 
   "Change youtube videos speed beyond 3x" 
   "(function() { const rate = prompt('Set the new playback rate', 2.5); 
        if (rate != null) {
            const video = document.getElementsByTagName('video')[0]; 
            video.playbackRate = parseFloat(rate); } })();")
