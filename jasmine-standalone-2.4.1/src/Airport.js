function Airport() {
  this.DEFAULT_CAPACITY = 5;
  this.hanger = [];
};

Airport.prototype.full = function(){
  return this.hanger.length >= this.DEFAULT_CAPACITY;
}

Airport.prototype.empty = function(){
  return this.hanger.length <= 0;
}


Airport.prototype.land = function(plane){
  if(this.full() === true){throw "Hanger is full"};
  if(weather.stormy() === true){throw "Weather is stormy"};
    this.hanger.push(plane);
  }

Airport.prototype.takeoff = function(plane){
  if(this.empty() === true){throw "Hanger is empty"};
  if(weather.stormy() === true){throw "Weather is stormy"};
    this.hanger.pop(plane);
}

