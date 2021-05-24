
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
