#!/bin/sh
goproxy() {
        export GOPROXY=https://athens.azurefd.net
        echo "GOPROXY ON"
}

ungoproxy() {
unset GOPROXY
echo "GOPROXY OFF"
}

echo "install go lsp bingo"
go get -u -v github.com/saibing/bingo
return

echo "install gocode"
go get -u -v github.com/stamblerre/gocode
echo "install godef"
go get -u -v github.com/rogpeppe/godef

echo "install dlv"
go get -u github.com/derekparker/delve/cmd/dlv
echo "install impl"
go get -u github.com/josharian/impl
echo "install gotests"
go get -u github.com/cweill/gotests/...
echo "install gomodifytags"
go get -u github.com/fatih/gomodifytags
echo "install fillstruct"
go get -u github.com/davidrjenni/reftools/cmd/fillstruct

goproxy
echo "install goimports"
go get -u -v golang.org/x/tools/cmd/goimports
echo "install guru"
go get -u -v golang.org/x/tools/cmd/guru
echo "install gorename"
go get -u -v golang.org/x/tools/cmd/gorename
echo "install gotype"
go get -u golang.org/x/tools/cmd/gotype
echo "install godoc"
go get -u golang.org/x/tools/cmd/godoc
ungoproxy
echo "plug install finish"
