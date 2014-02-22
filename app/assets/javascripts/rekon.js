/* exported Rekon */
var Rekon = (function() {

// Rekon
function Rekon(modules) {
  // attach all modules under the primary rekon object by their toString method
  modules.forEach(function(module) {
    if(module && module.toString && typeof module.toString === 'function') {
      this[module.toString()] = module;
    }
  }, this);
}

return Rekon;

}());
