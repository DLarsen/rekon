/* exported Minimap */
var Minimap = (function() {

// Minimap
function Minimap(minimap) {
  if(!minimap || (minimap && minimap.length < 1)) {
    return {};
  }
}

// dom selectors
Minimap.prototype._selectors = {
  MINIMAP: '.minimap',
  MINIMAP_CLOSE_CLASS: 'minimap-close',
  MINIMAP_TOGGLE: '.minimap-toggle',
  MINIMAP_SHOWCASE: '.minimap-showcase',
  MINIMAP_SHOWCASE_INITIAL: 'minimap-showcase-initial',
  MINIMAP_SHOWCASE_FINAL: 'minimap-showcase-final'
};

// init
Minimap.prototype.init = function() {
  $(this._selectors.MINIMAP_TOGGLE).on('click', $.proxy(this.toggle, this));
  $(this._selectors.MINIMAP).find('[data-toggle="tooltip"]').tooltip();
  window.setTimeout($.proxy(function() {
    this.showcase($(this._selectors.MINIMAP_SHOWCASE));
  }, this), 1000);
};

// showcase
Minimap.prototype.showcase = function($showcase) {
  if($showcase.length < 1) {
    return;
  }

  $showcase
    .removeClass(this._selectors.MINIMAP_SHOWCASE_INITIAL)
    .addClass('animated bounceInDown');

  // super delay the highlight removal
  window.setTimeout($.proxy(function() {
    $showcase.addClass(this._selectors.MINIMAP_SHOWCASE_FINAL);
  }, this), 5000);
};

// toggle
Minimap.prototype.toggle = function() {
  $(this._selectors.MINIMAP).toggleClass(this._selectors.MINIMAP_CLOSE_CLASS);
};

// to string
Minimap.prototype.toString = function() {
  return 'Minimap';
};

return Minimap;

}());
