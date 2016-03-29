function Airport() {
  this.DEFAULT_CAPACITY = 5;
  this.hanger = [];
};

Airport.prototype.full = function(){
  return this.hanger.length >= this.DEFAULT_CAPACITY;
}

Airport.prototype.land = function(plane){
    this.hanger.push(plane);
  }

