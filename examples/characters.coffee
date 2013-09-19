# Learning Processing
# Daniel Shiffman
# http://www.learningprocessing.com
# Example 17-8: Characters along a curve
# Adapted to CoffeeScript 

Processing = require('processing').Processing


class Characters
  setup: () ->
    @msg = 'text along a curve'
    @r = 100
    @size 640, 480
    f = @createFont 'Georgia', 40, true
    @textFont f
    @textAlign Processing.CENTER
    @smooth()

  draw: () ->
    @background 255

    # Start in the center and draw the circle
    @translate @width/2, @height/2
    @noFill()
    @stroke 0
    @ellipse 0, 0, @r*2, @r*2

    arclength = 0

    for c in @msg
      # The character and its width
      # Instead of a constant width, we check the width of each character.
      w = @textWidth c

      # Each box is centered so we move half the width
      arclength += w/2

      # Angle in radians is the arclength divided by the radius
      # Starting on the left side of the circle by adding PI
      theta = Math.PI + arclength/@r

      # Save transformation matrix
      @pushMatrix()

      # Polar to Cartesian conversion allows us to find the point along the curve.
      @translate @r * Math.cos(theta), @r * Math.sin(theta)

      # Rotate the box (rotation is offset by 90 degrees)
      @rotate theta + Math.PI/2

      # Display the character
      @fill 0
      @text c, 0, 0

      # Restore transformation matrix
      @popMatrix()

      # Move halfway again
      arclength += w/2


Processing.sketch Characters, 'Characters along a curve'
