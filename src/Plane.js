'use strict';

class Plane {
  land(airport) {
    airport.clearForLanding(this)
  };
  takeoff(airport) {
    airport.clearForTakeoff(this)
  };
};
