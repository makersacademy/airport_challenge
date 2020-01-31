'use strict';

describe('Feature Test:', function() {
  var plane = new Plane();
  var airport = new Airport();

  it('planes can be instructed to land at an airport', function() {
    plane.land(airport);
    expect(airport.planes()).toContain(plane);
  });
});
