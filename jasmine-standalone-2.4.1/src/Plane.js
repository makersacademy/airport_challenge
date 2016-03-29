function Plane() {
  this.status = false;
};

Plane.prototype.showstatus = function(){
  return this.status;
}

Plane.prototype.land = function(){
  this.status = true;
  return this.status;
}

Plane.prototype.takeoff = function(){
  this.status = false;
  return this.status;
}


