# Requirements

To-do list to follow the *Developer Manual*



- [x] SBCL >= 1.0

```bash
~/common-lisp$ sbcl -version

This is SBCL 2.0.1.debian, an implementation of ANSI Common Lisp.
More information about SBCL is available at <http://www.sbcl.org/>.

```



- [x] QuickLisp (optional)

  ```lisp
  * (member :quicklisp *features*)
  
  (:QUICKLISP :SB-BSD-SOCKETS-ADDRINFO :ASDF3.3 :ASDF3.2 :ASDF3.1 :ASDF3 :ASDF2
   :ASDF :OS-UNIX :NON-BASE-CHARS-EXIST-P :ASDF-UNICODE :X86-64 :64-BIT :ANSI-CL
   :COMMON-LISP :ELF :GENCGC :IEEE-FLOATING-POINT :LINUX :LITTLE-ENDIAN
   :PACKAGE-LOCAL-NICKNAMES :SB-CORE-COMPRESSION :SB-LDB :SB-PACKAGE-LOCKS
   :SB-THREAD :SB-UNICODE :SBCL :UNIX)
  
  ```

  

- [x] Lisp dependencies (**webkit**)

  ```bash
  ~/common-lisp$ ls -l
  
  total 12
  drwxrwxr-x  4 pedro pedro 4096 mai 17 19:05 cl-webengine
  drwxrwxr-x  5 pedro pedro 4096 mai 17 18:52 cl-webkit
  drwxrwxr-x 12 pedro pedro 4096 mai 19 23:06 nyxt
  
  ~/common-lisp/cl-webkit$ ls -l
  total 20
  -rw-rw-r-- 1 pedro pedro   79 mai 17 18:52 CONTRIBUTORS
  -rw-rw-r-- 1 pedro pedro 1066 mai 17 18:52 COPYING
  drwxrwxr-x 3 pedro pedro 4096 mai 17 18:52 demo
  -rw-rw-r-- 1 pedro pedro 1884 mai 17 18:52 README.org
  drwxrwxr-x 2 pedro pedro 4096 mai 17 18:52 webkit2
  
  ```

  

- [x] Gnu/Linux, FreeBSD GTK dependencies

  ```bash
  ~/common-lisp$ sudo apt install sbcl libwebkit2gtk-4.0-dev glib-networking gsettings-desktop-schemas libfixposix-dev xclip enchant
  
  Reading package lists... Done
  Building dependency tree       
  Reading state information... Done
  gsettings-desktop-schemas is already the newest version (3.36.0-1ubuntu1).
  enchant is already the newest version (1.6.0-11.3build1).
  libfixposix-dev is already the newest version (1:0.4.3-1).
  sbcl is already the newest version (2:2.0.1-3).
  xclip is already the newest version (0.13-1).
  glib-networking is already the newest version (2.64.2-1ubuntu0.1).
  libwebkit2gtk-4.0-dev is already the newest version (2.32.0-0ubuntu0.20.04.1).
  0 upgraded, 0 newly installed, 0 to remove and 8 not upgraded.
  
  ```

  

- [x] Lisp dependencies (**webengine**)

  ```bash
  ~/common-lisp$ ls -l
  
  total 12
  drwxrwxr-x  4 pedro pedro 4096 mai 17 19:05 cl-webengine
  drwxrwxr-x  5 pedro pedro 4096 mai 17 18:52 cl-webkit
  drwxrwxr-x 12 pedro pedro 4096 mai 19 23:06 nyxt
  
  ~/common-lisp/cl-webengine$ ls -l
  total 28
  -rw-rw-r-- 1 pedro pedro  454 mai 17 19:05 cl-webengine.asd
  -rw-rw-r-- 1 pedro pedro 1524 mai 17 19:05 LICENSE
  -rw-rw-r-- 1 pedro pedro   53 mai 17 19:05 Makefile
  -rw-rw-r-- 1 pedro pedro 2530 mai 17 19:05 README.org
  -rw-rw-r-- 1 pedro pedro 7515 mai 17 19:05 ROADMAP.org
  drwxrwxr-x 2 pedro pedro 4096 mai 17 19:05 source
  
  
  ```



- [x] Fetch the source code

  This is my [fork](https://github.com/pdelfino/nyxt/commits/master) of  Nyxt's repo. Being on **master**, I can keep the synchronization between my local version and the project with:

```bash
~/common-lisp/nyxt$ git fetch upstream
~/common-lisp/nyxt$ git rebase upstream/master
~/common-lisp/nyxt$ git rebase upstream/master

```

It is up-to-date. Using `git log` I can see:

```bash
Author: Pierre Neidhardt <mail@ambrevar.xyz>
Date:   Thu May 20 12:13:45 2021 +0200

    Version 2.0.

```



- [x] Running from source on SBCL 

  ```shell
  ~/common-lisp/nyxt$ sbcl
  
  ```

```lisp
* (require :asdf)
NIL
* (asdf:load-asd "/home/pedro/common-lisp/nyxt/nyxt.asd")
#<ASDF/FIND-SYSTEM:DEFINE-OP >
#<ASDF/PLAN:SEQUENTIAL-PLAN {1003F64DD3}>
* (ql:quickload :nyxt/gtk)
To load "nyxt/gtk":
  Load 1 ASDF system:
    nyxt/gtk
; Loading "nyxt/gtk"
.....................................
(:NYXT/GTK)
* (nyxt:start)
<INFO> [23:19:32] Listening to socket "/run/user/1000/nyxt/nyxt.socket".
Nyxt version 2.0.0
<INFO> [23:19:32] Loading Lisp file "/home/pedro/.config/nyxt/auto-config.lisp".
NIL


```



Browser is running.

