'use strict'
class Airport{
  constructor(){
    this._runway = [];
    this.capacity = 20;
  };

  planes(){
    return this._runway;
  };

  clearForLanding(plane) {
    this._runway.push(plane);
  };
  clearForTakeoff(plane){
    this._runway.pop(plane);
  }
};
