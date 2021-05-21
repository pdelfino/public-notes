One obstacle which one faces when beginning with common lisp is emacs.

It is so difficult to learn.

But actually, there exist a minimal set of commands 
which one needs for programming.
I use these commands currently:

;;;;;;;;;;;;;;;;;;;
;; install emacs in conda
;;;;;;;;;;;;;;;;;;;

conda create --name emacs
conda activate emacs # or: source activate emacs
conda install -c conda-forge emacs

;; when emacs starts, it either looks for ~/.emacs
;; or for ~/.emacs.d/init.el
;; similar to ~/.bashrc, one can put there commands which should always
;; run when emacs is started by the current user.
;; I will upload and update the init.el file's content here in the gists.

;;;;;;;;;;;;;;;;;;;
;; start emacs
;;;;;;;;;;;;;;;;;;;

;; start emacs session                 type `emacs` in your terminal
;; open existing file                  C-x C-f <write path to file> RET
;; open/create new "file" (buffer)     C-x C-f <write path to new file> RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Multiwindow/screen view - important for programmers (view)
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (open new window/Tab)
;; divide screen horizontally          C-x 2
;; divide screen vertically            C-x 3

;; jump between open screens           C-x o   (*o*ther)

;; open additional file (buffer)       C-x C-f (see above!) (*f*ile)

;; if the new file opens, apparently 
;; the former file disappears ...
;; don't panic! - relax!: 
;; everything you don't close in emacs 
;; stays open - just it is invisible
;; at the moment.

;; most editors use Tabs which stay
;; visible and which you can click
;; to switch between open files.
;; but emacs has buffers and 
;; switching between them you can
;; only through key combinations and
;; commands.
;; sth one has to get used to ...
;; Thus learn:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; How to manage windows/browsers/Tabs in emacs (navigation)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; in emacs, you don't have Tabs
;; but buffers:
;; everytime you open a new file, 
;; you create actually a new 'buffer'
;; so learn to manage buffers 
;; and to jump between the 
;; files/tabs/buffers:
;;
;; switch to previously opened buffer     C-x C-b ;; choose there by mouse 
;;                                                ;; or by emacs navigaion
;;                                                ;;    e.g. C-p and C-n
;;                                                ;; press RET
;; switch to recently opened buffer       C-x b RET (go to *b*uffer)
;; switch to buffer by name               C-x b <buffer name> RET
;;
;; close/kill current buffer              C-x k  (*k*ill)
;;   (but leave window open!)
;; close/kill current window              C-x 0  (kill current/here/now - zero)
;;   (but leave buffer open!)
;; kill all other windows/screens         C-x 1  (the complement of zero)
;;   (except where cursor is now, however
;;    all buffers stay open!
;;    buffers are closed only after
;;    kill buffer command!)               (which is `C-x k`)

;; maximize/minimize windows ...          (see s"Window settings" at bottom!)
;; change the area they cover on screen ..

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; moving (browsing)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; move in text                           arrows keys
;;                                        or the C-... combinations below
;;                                        (quicker/more convenient!)
;; 
;; scroll page up                         C-v (*v*iew)       or PageUp
;;        page down                       M-v                or PageDown
;;        line up                         C-p (*p*rev line)  or arrow key up
;;        line down                       C-n (*n*ext line)  or arrow key down

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Search for a word in emacs (browsing)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; search word forward                    C-s
;;             backward                   C-r
;; regex search forward                   C-M-s       (search with `-M-`)
;;              backward                  C-M-r
;; in both searches, once invoked:
;; cycle through searches                 C-s and C-r (repeatadly)
;; search strings are saved (kill ring)   
;; cycle through previous search strings  M-p and M-n (*p*rev *n*ext search)
;; quit search modus                      C-g         (*g*o away)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; How to cancel/abort/undo (editing) commands?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; you began input of key combination, 
;; but inmidst of pressing keys, you realize
;; "oh, this was wrong!" what to do?
;; cancel command!                        C-g         (*g*o away)
;;
;; Or a key combination did do sth 
;; you didn't want.
;; How to undo?                           C-x u (*u*ndo!)
;; multiple undo                          C-x u  C-x u ...
;;   (press undo so many times!)
;;
;; Oh, too many undos, how to redo?
;; change undo-ring direction             C-f
;; and then "undo" (redo) backwards!      C-x u C-x u ...
;; but be careful! 
;; don't rely too much on this.
;; it becomes quickly unintuitive
;; and undo the undo of the undo 
;; might be difficult or impossible!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; moving cursor in emacs (editing)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; perhaps most confusing at beginning!

;; back    (character)                    C-b (*b*ack)       or arrow left
;; forward (character)                    C-f (*f*orward)    or arrow right
;; back    (word)                         M-b                or M-arrow left
;; forward (word)                         M-f                or M-arrow right
;; back    (line) = up   (line)           C-p (*p*rev line)  or arrow up
;; forward (line) = down (line)           C-n (*n*ext line)  or arrow down
;; back    (page) = up   (page)           C-v (*v*iew)       or PageUp
;; forward (page) = down (page)           M-v                or PageDown
;; start   (line)                         C-a
;; end     (line)                         C-e
;; start   (sentence)                     M-a
;; end     (sentence)                     M-e

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mark words/regions and copy or delete (kill) them (editing)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; copying in emacs - how usually taught:
;; 1. set mark                            C-SPC
;; 2. then move the cursor                (see `moving cursor` above!)
;; 3. then tell emacs what to do with
;;      the marked region/text:
;;    "copy"                              M-w
;;    "cut out"                           C-w
;;    "delete"                            DEL
;;    "insert" previous copy/cut chunks   C-y (*y*ank)
;;                                        or just type what to insert
;;
;; But here is a more convenient way: 
;; 1. move cursor in combination with    -S- (Shift)
;;    (move and mark at once!)
;; 2.then tell emacs
;;    "copy"                              M-w
;;    "cut out"                           C-w
;;    "delete"                            DEL
;;    "insert" previous copy/cut chunks   C-y (*y*ank) ;; see next section!
;;                                        or just type what to insert
;;
;; delete until end of line               C-k (*k*ill line)
;; delete whole line (without killring)   C-S-DEL
;;                   (with killring)      C-w
;;  (kill whole line when no mark set)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; paste (yank) in emacs (editing)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; paste sth already copied/cut           C-y
;; get sth previously copy/cutted (cycle) C-y M-y
;;   (or un-emacs-ish)                    F10 (Menue) 
;;                                          > (C-f or arrow right) Edit 
;;                                          > (C-n or arrow down until) 
;;                                            "Paste from Kill Menu"
;; (kill ring contains ~60 
;;       recently cut/copied text pieces)
;;
;; move/copy/cut/paste procedure is 
;; the most difficult thing to get used!!
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Search and replace in emacs (editing)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; invoke simple 'search and replace'     M-% (which is: M-S-5) 
;;                                            <type search string> RET 
;;                                            <type replace string> RET
;; cycle through occurrences by:
;; replacing                              SPC
;; skipping                               DEL
;; replace and stop                       .
;; replace all without asking             !
;; return to previously replaced text     ^
;;
;; simple search & replace                M-x replace-string RET 
;;   (without query for each match case)      <search string> RET 
;;                                            <replace string> RET
;; regex search and replace               M-x query-replace-regexp RET 
;;                                            <type regexpr> RET 
;;                                            <type replace str> RET
;; cycle through occurrences by:
;; replacing                              SPC
;; skipping                               DEL
;; replace and stop                       .
;; replace all without asking             !
;; return to previously replaced text     ^
;;
;; regex search and replace              M-x replace-regexp RET 
;;   (without query for each match case)     <type search regexpr> RET
;; remarks to replace strings:               <type replace string> RET
;;
;; if different replace string
;;    for each case, use:                \? as <replace string>
;; 
;; emacs is written in elisp:            replace strings for search replace 
;;                                            can be lisp expressions!
;;                                            (which will be evaluated!)
;;
;; Examples:
;;
;;                                       M-x replace-regexp <RET> 
;;                                        ^.\{0,72\}$ <RET> 
;;                                        \,(format "%-72sABC%05d" \& \;;) <RET>
;;                                       ;; lisp format expression!
;; useful references in replace string
;;                                       \& means entire match
;;                                       \;; means nth match number 
;;                                           (number of match)
;;                                       \1, \2, ... regex references to matches 
;;                                           (groups)
;;
;;                                       M-x replace-regexp <RET> 
;;                                        \(x\)\|y <RET> 
;;                                        \,(if \1 "y" "x") <RET> 
;;                                       ;; lisp if form

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; undo and redo (editing)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; by all this editing, don't forget:
;; cancel command inmidst key input      C-g (*g*et out!!)
;; undo / redo                           C-x u (*u*ndo) ... / C-f C-x u ...
;;  (a little bit unintuitive)
;; be very careful! 
;; C-u (without x) 
;; makes sentence Uppercase
;; so if you while C-x u-ing get
;; a sentence uppercase, you know 
;; you pressed C-u and not C-x u.
;; this is bad.
;; either you can C-x u more back 
;; or since you introduced new change,
;; you can't C-x u or C-f C-x u 
;; back to your original point ... 
;; (you created new branch)
;; thus avoid this mistake! ...
;; prevent this C-u trap by:             add to your ~/.emacs or ~/.emacs.d file
;;                                          (put 'upcase-region 'disabled t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; save and/or quit emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; save/write the buffer to the file     C-x C-s (*s*ave)
;; close all windows/ leave emacs        C-x C-k (generally *k*ill emacs)
;;   (it asks if some buffer not saved)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Window settings (view)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; window width wider                    C-x C-} (actually C-x C-S-])
;;              narrower                 C-x C-{
;;              taller                   C-x C-^
;;              shrink                   C-x C--
;;   (if buffer smaller than window)
;; window all same size                  C-x C-+
;; kill-buffer-and-window (current)      C-x 4 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Text font size (view)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; increase                              C-x C-+
;; decrease                              C-x C--

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; shell in emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; start shell process                   M-x shell
;; stop shell process                    $ exit
;;                                       and then kill buffer by C-x k RET

;; in the shell previous/after command   C-arrowUp/Down   ;; or M-p/M-n
;; got to beginning of line but after $  C-c C-a


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Common-Lisp-specific commands for coding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; any file ending with ".lisp" will activate lisp-mode of emacs.
;; but to write and rund and try common lisp in emacs, you have to activate slime-mode:
;; start slime-mode                      M-x slime RET   ;; opens an extra window for slime below
;;                                       ;; it start a server which sends its result to the slime window
;; stop slime server                     M-x slime-quit-lisp  and do with curser in slime window   C-x k RET to close buffer
;;
;; execute/evaluate s-expression         put cursor behind any lisp formula and 
;; send to running slime and evaluate    C-x C-e
;;                                       (by this I test function by function)
;;                                       (variable by variable...)
;;
;; send and compile entire file to slime C-c C-k
;;
;; close all open parentheses            C-c C-]
;;
;; there is still alot to learn see: 
;;           https://common-lisp.net/project/slime/doc/slime.pdf

;; whoever has more commands which he uses daily:
;; please comment!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clojure-specific commands for coding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; any file ending with ".clj" will activate clojure-mode of emacs.
;; but to write and run and edit clojure code in emacs, you have to activate clojure-nrepl server:

;; start a clojure-nrepl server session  M-x cider-jack-in
;; to stop the REPL session do later     M-x cider-quit

;; change namespace of repl              C-c M-n <namespace name>RET

;; while a clojure-nrepl is running, you can use the clojure-specific commands in your file;

;; How to send code to the nrepl from your coding file:
;; compile entire file (send it to repl) C-c C-k         ;; or: M-x cider-load-buffer
;; compile pre-cursor s-expression       C-c C-e         ;; or: M-x cider -eval-last-sexp

;; Run tests                             C-c C-t t
;;    or using lein in shell             $ lein test

;; show docstring of function            cursor in function name and then: C-c C-d d
;;                                       ;; or in repl:  (clojure.repl/doc <functionname>)
;;                                       ;; or in repl:  (use 'clojre.repl)
;;                                       ;;              (doc <functionname>)

;; clear REPL when too cluttered         M-x cider-repl-clear-buffer

;; previous/later expressions            C-arrowUp/C-arrowDown  M-p/M-n

;; show function source code             M-.
;; pop stack and return to previous      M-,
;; list all definitions in file          M-x imenu    ; and jump to one

;; in repl, close all parentheses        C-RET







