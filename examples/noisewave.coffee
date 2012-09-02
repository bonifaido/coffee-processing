Processing = require('processing').Processing


class NoiseWave
  setup: () ->
    @size 200, 200
    @frameRate 30

    @colorMode Processing.RGB, 255, 255, 255, 100
    @smooth()
    @w = @width + 16
    @y_values = []
    @x_spacing = 8
    @yoff = 0.0

  draw: () ->
    @background 0
    @calcWave()
    @drawWave()

  calcWave: () ->
    dx = 0.05
    dy = 0.01
    amplitude = 100.0

    @yoff += dy

    xoff = @yoff

    for i in [0..@w/@x_spacing]
      @y_values[i] = (2 * @noise(xoff) - 1) * amplitude
      xoff += dx

  drawWave: () ->
    @noStroke()
    @fill 255, 50
    @ellipseMode Processing.CENTER

    for v, x in @y_values
      @ellipse x * @x_spacing, @width/2 + v, 16, 16


Processing.sketch NoiseWave, 'Noise Wave'
