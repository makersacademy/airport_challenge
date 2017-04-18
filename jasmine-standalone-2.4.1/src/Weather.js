function Weather() {
}

Weather.prototype.random = function(){
  return Math.floor(Math.random() * (11 - 1)) + 1;
}

Weather.prototype.stormy = function(){
  if(this.random() === 1){
    return true;
  } else {
    return false;
  }
 }