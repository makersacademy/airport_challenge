'use strict';

function Airport(weather){
  this._weather = typeof weather !== 'undefined' ? weather : new Weather();
  this._hangar = [];
//   this.planes = function(){
//     return hanger;
//   }
//   this.clearForLanding = function(plane) {
//     if(this.isStormy()) {
//       throw new Error('cannot land during storm');
//     }
//     hanger.push(plane);
//   };
//   this.clearForTakeOff = function(plane){
//     if(this.isStormy()) {
//       throw new Error('cannot takeoff during storm');
//     }
//     hanger = [];
//   };
//   this.isStormy = function(){
//     return false;
//   };
}

Airport.prototype.planes = function(){ return this._hangar; };
Airport.prototype.clearForLanding = function(plane) {
  if(this._weather.isStormy()) {
    throw new Error('cannot land during storm');
  }
  this._hangar.push(plane);
};
Airport.prototype.clearForTakeOff = function(plane) {
  if(this._weather.isStormy()) {
    throw new Error('cannot takeoff during storm');
  }
  this._hangar = [];
};
