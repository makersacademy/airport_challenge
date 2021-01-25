'use strict';

class Plane {
    constructor() {
      this.__location;
    }
    land(airport){
      airport.clearForLanding(this);
      this._location = airport;
    };
    takeoff(airport) {
      this._location.clearForTakeOff();
    }
};
