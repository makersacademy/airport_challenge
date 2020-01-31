'use strict';

class Airport {
  constructor() {
  this._hangar = []
  }
  planes () {
    return this._hangar;
  }

  clearForLanding(plane) {
    this._hangar.push(plane);
  };

  clearForTakeOff(plane) {
    this._hangar = [];
  }
};
