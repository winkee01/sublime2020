
## 1. Install lsp (client) plugin
Ctrl + Shift + P > LSP

## 2. Instal languager server
Install a language server for the specific language (e.g. Go)


## Go language server

#### (1) Official go-langserver

Install:

```
go get golang.org/x/tools/gopls@latest
```

Enable:

```
Ctrl + Shift + P > LSP: Enable Language Server Globally
```

choose **gopls**

#### (2) Sourcegraph's go-langserver

Install:
```
go get github.com/sourcegraph/go-langserver
```

Enable:
```
Ctrl + Shift + P > LSP: Enable Language Server Globally
```

choose **golsp** (the acutual executalbe is `go-langserver`)


Note:
If not found `gopls` or `go-langserver`

Try this:

(1) add GOPATH to `~/.profile`
(2) add below config into LSP client settings

```
"env": {
    "GOPATH": "/Users/winkee/dev/goll/bin",
    "PATH": "/usr/local/go/bin"
}
```

#### Reference:
https://lsp.readthedocs.io/en/latest/#go









