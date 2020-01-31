'use strict';

function Airport() {
  this._hangar = [];
}
Airport.prototype.planes = function(){
  return this._hangar;
};
Airport.prototype.clearForLanding = function(plane) {
  if(this._hangar.length >= 10 ) {
    throw new Error('Cannot land plane. The airport is full.');
  }
  this._hangar.push(plane);
};
Airport.prototype.clearForTakeOff = function(plane) {
  this._hangar.pop();
};
