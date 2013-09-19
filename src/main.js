function usage() {
  print("Usage:")
  print("  csp5 path/to/sketch")
  quit()
}

if (arguments.length < 1) {
  usage()
}

function loadCoffeeFile(path) {
  var CoffeeScript = require('coffee-script').CoffeeScript
  var code = CoffeeScript.compile(readFile(path)) //, { bare: true })
  eval(code)
}

var pathToSketch = arguments[0]


if (/\.js$/.test(pathToSketch)) {
  load(pathToSketch)
} else if (/\.coffee$/.test(pathToSketch)) {
  loadCoffeeFile(pathToSketch)
}
