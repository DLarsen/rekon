/* exported Timber */
var Timber = (function() {

// Timber
function Timber(modules) {
  // attach all modules under the primary Timber object by their toString method
  modules.forEach(function(module) {
    if(module) {
      if(module.init && typeof module.init === 'function') {
        module.init();
      }
      if(module.toString && typeof module.toString === 'function') {
        this[module.toString()] = module;
      }
    }
  }, this);
}

return Timber;

}());
