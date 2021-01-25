'use strict';

function Plane(){
  // this._location;

//   this.land = function(airport) {
//     airport.clearForLanding(this);
//     location = airport;
//   };
//   this.takeoff = function() {
//     location.clearForTakeOff('')
//   };
}

Plane.prototype.land = function(airport){
  airport.clearForLanding(this);
  this._location = airport;
};
Plane.prototype.takeoff = function(airport){
  this._location.clearForTakeOff('');
};
