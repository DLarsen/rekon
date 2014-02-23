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
  MINIMAP_TOGGLE: '.minimap-toggle'
};

// init
Minimap.prototype.init = function() {
  $(this._selectors.MINIMAP_TOGGLE).on('click', $.proxy(this.toggle, this));
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
