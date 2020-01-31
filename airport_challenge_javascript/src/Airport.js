'use strict';

function Airport() {
  this._hangar = [];
  this._MAX_CAPACITY = 10;
}
Airport.prototype.planes = function(){
  return this._hangar;
};
Airport.prototype.clearForLanding = function(plane) {
  if(this._isFull()) {
    throw new Error('Cannot land plane. The airport is full.');
  }
  this._hangar.push(plane);
};
Airport.prototype.clearForTakeOff = function(plane) {
  this._hangar.pop();
};
Airport.prototype._isFull = function() {
  return this._hangar.length >= this._MAX_CAPACITY;
};
