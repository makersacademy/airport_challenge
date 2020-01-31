'use strict'
class Airport{
  constructor(){
    this._runway = []
  }

  planes(){
    return this._runway;
  };

  clearForLanding(plane) {
    this._runway.push(plane)
  };
};
