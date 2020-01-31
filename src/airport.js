'use strict';

class Airport {
  constuctor() {
    this._hangar = []
  }
  planes () {
    return this._hangar;
  };

  clearForLanding(plane) {
    this._hangar.push(plane);
  };
};
