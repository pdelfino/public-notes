
(define-bookmarklet-command hack-youtube-speed 
   "Change youtube videos speed beyond 3x" 
   "(function() { const rate = prompt('Set the new playback rate', 2.5); 
        if (rate != null) {
            const video = document.getElementsByTagName('video')[0]; 
            video.playbackRate = parseFloat(rate); } })();")
