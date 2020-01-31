'use strict';

class Airport{
  constructor() {
    this._hangar = []
  }

  planes() {
    return this._hangar;
  }

  clearforLanding(plane) {
    this._hangar.push(plane);
  };

  clearForTakeoff(plane) {
    this._hangar = [];
  }
};
