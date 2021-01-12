'use strict';

describe('Feature test:', function() {
  var plane;
  var airport;

  beforeEach(function() {
    plane = new Plane();
    airport = new Airport();
  });

  it("instructs a plane to land when flying", function(){
    plane.land(airport);
    expect(airport.planes()).toContain(plane);
  });
  it("instructs a plane to take off when landed", function(){
    plane.takeoff(airport);
    expect(airport.planes()).not.toContain(plane);
  })

});
