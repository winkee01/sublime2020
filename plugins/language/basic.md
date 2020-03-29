
### All Autocomplete


### DocBlockr
Formatting comments to standard, can be used in PHP, JS, etc.



### SublimeCodeIntel

### CTags

### SublimeLinter

after we installed SublimeLinter, we need to install `eslint` and `jslint`:

```shell
npm install -g eslint
npm install -g jslint
```

then, in user settings of SublimeLinter,

```json
"linters": {
    "eslint": {
        "executable": "/usr/local/bin/eslint",
        "env": {"PATH":"/usr/local/opt/node@10/bin/"},
        "selector": "text.html.vue, source.js - meta.attribute-with-value"
    }
}
```


