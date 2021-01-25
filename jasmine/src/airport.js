'use strict';

class Airport{
  constructor(weather) {
    this._weather = typeof weather !== 'undefined' ? weather : new Weather();
    this._hangar = []
  }
  planes() {
    return this._hangar;
  }
  clearForLanding(plane) {
    this._hangar.push(plane);
  };
  clearForTakeOff(plane) {
    if(this._weather.isStormy()) {
      throw new Error('cannot takeoff during storm');
    }
    this._hangar = [];
  }
  isStormy() {
    return false;
  }
};
