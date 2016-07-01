# Broccoli-shell

`broccoli-shell` allows you to build the output of arbitrary shell scripts as a
Broccoli node.

# Usage
```
var shell = require('broccoli-shell');
var compiledMake = shell([inputTree1, inputTree2], {
  command: function(outputPath) {
    return 'make && cp -r output ' + outputPath;
  },
  pwd: __dirname
});
```

## `shell(inputs, options)`
`inputs` optionally specifies an array of input Broccoli nodes.

`options` is an object which at least includes `command` and might also include
`pwd`.

`options.command` is either a function or string. If a string, it is executed
using `shelljs`. If a function, it is passed the path to the output directory of
the node and is expected to return a string to be executed using `shelljs`.

`options.pwd` is an optional string which specifies the working directory for
executing `options.command`.

# License
Copyright 2016 Lehao Zhang. Released to the general public under the terms of
the ISC license.
