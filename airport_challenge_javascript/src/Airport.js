'use strict';

function Airport() {
  this._hangar = [];
  this._MAX_CAPACITY = 10;
  this._CHANCE_OF_STORMY = 0.5;
};
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
  if(this.isStormy()) {
    throw new Error('Cannot takeoff plane. The weather is stormy.');
  }
  this._hangar.pop();
};
Airport.prototype._isFull = function() {
  return this._hangar.length >= this._MAX_CAPACITY;
};
Airport.prototype.isStormy = function() {
  return (Math.random() > this._CHANCE_OF_STORMY);
};
