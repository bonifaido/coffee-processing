(function() {
  var Processing,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  importPackage(Packages.processing.core);

  Processing = (function(_super) {

    __extends(Processing, _super);

    function Processing() {}

    Processing.sketch = function(klass, title) {
      Processing.current = new JavaAdapter(PApplet, new klass);
      return PApplet.runSketch([title], Processing.current);
    };

    return Processing;

  })(PApplet);

  exports.Processing = Processing;

}).call(this);