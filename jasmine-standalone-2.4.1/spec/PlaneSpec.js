describe ("plane", function() {

  var plane;

  beforeEach(function(){
    plane = new Plane();
  });

  it("status initializes as false", function(){
    expect(plane.showstatus()).toEqual(false);
  });

  it("status when landed to change to true", function(){
    expect(plane.land()).toEqual(true);
  });

  it("status when takeoff to change to true", function(){
    plane.land();
    expect(plane.takeoff()).toEqual(false);
  });

});