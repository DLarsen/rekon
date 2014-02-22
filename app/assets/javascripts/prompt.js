/* exported Prompt */
var Prompt = (function() {

// Prompt
function Prompt() {}

// dom selectors
Prompt.prototype._selectors = {
  RADIO: '.prompt-radio-input',
  RADIO_OTHER: '.prompt-radio-other'
};

// clear the "other" answer for radios
Prompt.prototype.clearOther = function() {
  $(this._selectors.RADIO_OTHER).val('');
};

// clear all prompt radios
Prompt.prototype.clearRadio = function() {
  $(this._selectors.RADIO).prop('checked', false);
};

// init
Prompt.prototype.init = function() {
  $(this._selectors.RADIO).on('click', $.proxy(this.clearOther, this));
  $(this._selectors.RADIO_OTHER).on('click', $.proxy(this.clearRadio, this));
};

// to string
Prompt.prototype.toString = function() {
  return 'Prompt';
};

return Prompt;

}());
