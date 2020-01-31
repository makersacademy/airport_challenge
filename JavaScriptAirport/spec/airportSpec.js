'use strict'
describe('Airport', function(){
  var airport;
  var plane;
  beforeEach(function(){
    airport = new Airport();
    plane = jasmine.createSpyObj('plane', ['clearForLanding']);
  });
  it('allows plane to land at airport', function() {
    expect(airport.land).not.toBeUndefined()
  });
  it('planes can land at airport', function(){
    airport.land(plane);
    expect(plane.clearForLanding).toHaveBeenCalledWith(airport);
  });
  it('has no planes by default', function(){
    expect(airport.planes()).toEqual([]);
  });
});
