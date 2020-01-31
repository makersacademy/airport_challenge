'use strict';

describe('Feature Test:', function() {
  var airport;
  var plane;

  beforeEach(function(){
    airport = new Airport();
    plane = new Plane();
  });

  it('planes can be instructed to land at an airport', function() {
    plane.land(airport);
    expect(airport.planes()).toContain(plane);
  });
  it('planes can be instructed to takeoff', function() {
    plane.land(airport);
    plane.takeoff(airport);
    expect(airport.planes()).not.toContain(plane);
  });
  describe('when the airport is full', function() {
    it('planes cannot be instructed to land', function() {
      for(var i = 0; i < 9; i++) {
        plane.land(airport);
      }
      plane.land(airport);
      expect(function(){ airport.clearForLanding(plane); }).toThrowError('Cannot land plane. The airport is full.');
      expect(airport.planes().length).toEqual(10)
    });
  });
  describe('under stormy conditions', function() {

    it('planes cannot takeoff ', function(){
      plane.land(airport);
      spyOn(airport, 'isStormy').and.returnValue(true);
      expect(function(){ plane.takeoff();}).toThrowError('Cannot takeoff during storm');
      expect(airport.planes()).toContain(plane);
    });
  });
});
