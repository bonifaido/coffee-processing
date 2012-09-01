importPackage(Packages.processing.core)

# Extend PApplet to inherit it's static member variables
class Processing extends PApplet
  constructor: () ->

  @sketch: (klass, title) ->
    Processing.current = new JavaAdapter(PApplet, new klass)
    PApplet.runSketch([title], Processing.current)

exports.Processing = Processing
