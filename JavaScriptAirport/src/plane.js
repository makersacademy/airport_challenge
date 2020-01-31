'use strict'
class Plane {
  constructor() {
    this._location;
  };

  land(airport) {
    airport.clearForLanding(this)
    this._location = airport
  };

  takeoff(airport) {
    this._location.clearForTakeoff()
  };
};
