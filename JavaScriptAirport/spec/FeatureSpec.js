'use strict';
describe('Feature Test', function (){
  var plane;
  var airport;

  beforeEach(function(){
    plane = new Plane();
    airport = new Airport();
  });
  it('allows planes to land at the airport', function(){
    airport.land(plane)
    expect.airport.plane().toContain(plane)
  });
});
