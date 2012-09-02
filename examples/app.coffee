Processing = require('processing').Processing


class DemoSketch
  setup: () ->
    @size 300, 300
    @background 0
    @noFill
    @frameRate 10

  draw: () ->
    x = @random 0, @width
    y = @random 0, @height
    size = @random 10, 100
    @color (@random 0, 255), (@random 0, 255), (@random 0, 255)
    @ellipse x, y, size, size
    @background 0 if @frameCount % 100 is 0


Processing.sketch(DemoSketch, "https://gist.github.com/1114064")
