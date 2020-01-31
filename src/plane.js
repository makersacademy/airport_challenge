'use strict';

class Plane {
  constructor() {
    this._location;
  }
  land(airport) {
    airport.clearforLanding(this)
    this._location = airport;
  };
  takeoff() {
    this._location.clearForTakeoff()
  }
};
