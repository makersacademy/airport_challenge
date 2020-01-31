'use strict'
describe('Plane', function(){
  var plane;
  var airport
  beforeEach(function(){
    plane = new Plane();
    airport = jasmine.createSpyObj('airport',['clearForLanding','clearForTakeoff']);
  });
  it('can land at an airport', function(){
    plane.land(airport);
    expect(airport.clearForLanding).toHaveBeenCalledWith(plane);
  });
  it('can takeoff from the airport', function(){
    plane.land(airport);
    plane.takeoff(airport);
    expect(airport.clearForTakeoff).toHaveBeenCalledWith();
  });
});
