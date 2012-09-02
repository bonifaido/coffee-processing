# Ported from http://nodebox.net/code/index.php/Graphics_State

Processing = require('processing').Processing


class Orbit
  setup: () ->
    @size 450, 450
    @frameRate 30
    @smooth()
    @fill 0
    @f = @createFont 'Helvetica', 40

  draw: () ->
    @background 255
    @translate 225, 225

    @textFont @f
    @ellipse 0, 0, 10, 10
    @text 'sun', 10, 0

    for i in [0..3]
      @pushMatrix()

      @rotate @frameCount / -180.0 * Math.PI + i * Math.PI / -1.5
      @line 0, 0, 120, 0

      @translate 120, 0
      @ellipse 0, 0, 10, 10
      @textFont @f, 22
      @text 'planet', 10, 0

      @rotate @frameCount / -30.0 * Math.PI 
      @line 0, 0, 30, 0
      @textFont @f, 15
      @text 'moon', 32, 0

      @popMatrix()


Processing.sketch Orbit, 'Orbit'
