class Airport {
  constructor() {
    this.runway = [];
    this.capacity = 20;
    this.CHANCE_OF_STORM = 0.5;
  }

  land(plane) {
    if (this.isStormy()) {
      throw new Error('Cannot Land In This Weather')
    } else if (this.runway.length === this.capacity) {
      throw new Error('Airport Full');
    }
    this.runway.push(plane);
  }

  takeoff() {
    if(this.isStormy()) {
      throw new Error('Cannot Takeoff In This Weather')
    } else if (this.runway.length === 0) {
      throw new Error('Airport Empty');
    }
    this.runway.pop();
  }

  isStormy() {
    return(Math.random() > this.CHANCE_OF_STORM)
  };
}

class Plane {

};