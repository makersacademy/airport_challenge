'use strict';

describe('Feature Test', function() {
  var plane;
  var airport;

  beforeEach(function() {
    plane = new Plane();
    airport = new Airport();

  });

  it('instructs planes to land at airport', function() {
    plane.land(airport);
    expect(airport.planes()).toContain(plane);
  });

  it('can have planes takeoff', function() {
    plane.land(airport)
    plane.takeoff();
    expect(airport.planes()).not.toContain(plane);
  });
});
