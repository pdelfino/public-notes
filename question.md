
### Replicando a apresentação do FOSDEM 2020

1 - Por que não consigo fazer:

```
CL-USER> (nyxt:set-url "https://ambrevar.xyz")
; Debugger entered on #<SB-INT:SIMPLE-PROGRAM-ERROR "odd number of &KEY arguments" {100777CE73}>
[1] CL-USER> (nyxt:set-url-new-buffer "https://ambrevar.xyz")
; Debugger entered on #<SB-INT:SIMPLE-PROGRAM-ERROR "odd number of &KEY arguments" {10061A33B3}>
<INFO> [14:44:09] Loading "ht
```  
  
2 - Por que não consigo criar em _real time_ isso aqui:


The variable DELETE-WIKI-BUFFERS is unbound.
   [Condition of type UNBOUND-VARIABLE]

```
(define-command delete-wiki-buffers ()
  (let* ((all-buffers
	  (alexandria:hash-table-values (buffers *interface*)))
	 (buffers-to-delete (delete-if-not (lambda (u)
					     (str:contains?
					      "wikipedia.org"  u))
					   all-buffers
					   :key #'url)))
    (mapcar #'rpc-buffer-delete buffers-to-delete)))
```

3 - alguns textos ainda estão com o nome de next

4 - qual desses é de fato a minha init file?
```
$ find ~/ -type f -name "init.lisp"
/home/pedro/.quicklisp/dists/quicklisp/software/acclimation-20200925-git/init.lisp
/home/pedro/.quicklisp/dists/quicklisp/software/cl-gobject-introspection-20210124-git/src/init.lisp
/home/pedro/common-lisp/nyxt/_build/quicklisp-client/dists/quicklisp/software/acclimation-20200925-git/init.lisp
/home/pedro/common-lisp/nyxt/_build/quicklisp-client/dists/quicklisp/software/cl-gobject-introspection-20210124-git/src/init.lisp
```


5 - 

```
javascript:(function() {   const rate = prompt('Set the new playback rate', 4);   if (rate != null) {     const video = document.getElementsByTagName('video')[0];     video.playbackRate = parseFloat(rate);   } })();
```

;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

(define-bookmarklet-command hack-youtube-speed
  "Change youtube videos speed beyond 3x"
  "(function() {
  const rate = prompt('Set the new playback rate', 2.5);
  if (rate != null) {
    const video = document.getElementsByTagName('video')[0];
    video.playbackRate = parseFloat(rate);
     }
  })();")

