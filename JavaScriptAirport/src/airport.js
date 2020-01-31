'use strict'
class Airport {
  constructor(weather) {
    this.DEFAULT_CAPACITY = 20;
    this._weather = typeof weather !== 'undefined' ? weather : new Weather();
    this._runway = [];
    this.capacity = this.DEFAULT_CAPACITY;
  };

  planes() {
    return this._runway;
  };

  clearForLanding(plane) {
    if (this._weather.isStormy()) {
      throw new Error('Landing prohibited due to storm conditions');
    };
    if (this._runway.length  == this.capacity) {
      throw new Error("Airport Full!");
    };
    this._runway.push(plane);
  };

  clearForTakeoff(plane) {
    if (this._weather.isStormy()) {
      throw new Error('Takeoff prohibited due to storm conditions');
    };
    if (this._runway.length == 0) {
      throw new Error("Airport Empty!");
    };

    this._runway.pop(plane);
  };
  isStormy(){
    return false;
  };
};
