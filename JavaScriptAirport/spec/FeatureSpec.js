'use strict';
describe('Feature Test', function() {
  var plane;
  var airport;

  beforeEach(function() {
    plane = new Plane();
    airport = new Airport();
  });
  describe('normal weather conditions', function() {
    beforeEach(function(){
      spyOn(Math, 'random').and.returnValue(0);
    });

    it('allows planes to land at the airport', function() {
      plane.land(airport);
      expect(airport.planes()).toContain(plane)
    });
    it('planes can takeoff', function() {
      plane.land(airport);
      plane.takeoff(airport);
      expect(airport.planes()).not.toContain(plane);
    });
  });

  describe('stormy conditions', function() {
    it('stops planes from taking off when weather is stormy', function() {
      spyOn(Math, 'random').and.returnValue(0);
      plane.land(airport);
      spyOn(airport._weather, 'isStormy').and.returnValue(true);
      expect(function(){
        plane.takeoff(airport);
      }).toThrowError('Takeoff prohibited due to storm conditions');
      expect(airport.planes()).toContain(plane);
    });

    it('stops planes from landing when weather is stormy', function() {
      spyOn(Math, 'random').and.returnValue(1);
      expect(function() {
        plane.land(airport);
      }).toThrowError('Landing prohibited due to storm conditions');
      expect(airport.planes()).not.toContain(plane);
    });
  });
});
