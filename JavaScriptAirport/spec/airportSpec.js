'use strict'
describe('Airport', function() {
  var airport;
  var plane;
  var weather;

  beforeEach(function() {
    plane = jasmine.createSpy('plane',['land']);
    weather = jasmine.createSpyObj('weather',['isStormy']);
    airport = new Airport(weather);
  });

  it('has no planes by default', function() {
    expect(airport.planes()).toEqual([]);
  });

  describe('normal conditions', function() {
    beforeEach(function() {
      weather.isStormy.and.returnValue(false);
    });
    it('can clear planes for landing', function() {
      airport.clearForLanding(plane);
      expect(airport.planes()).toEqual([plane]);
    });
    it('can clear planes for takeoff', function() {
      airport.clearForLanding(plane);
      airport.clearForTakeoff(plane);
      expect(airport.planes()).toEqual([]);
    });
  });


  describe('capacity', function() {
    it('responds to capacity', function() {
      expect(airport.capacity).not.toBeUndefined();
    });
    it('sets default capacity', function() {
      expect(airport.capacity).toEqual(airport.DEFAULT_CAPACITY);
    });
    it('raises an error if full', function() {
      airport.capacity = 1;
      airport.clearForLanding(plane);
      expect(function() {
        airport.clearForLanding(plane);
      }).toThrowError("Airport Full!");
    });
    it('raises an error if empty', function() {
      expect(function() {
        airport.clearForTakeoff(plane);
      }).toThrowError("Airport Empty!");
    });
  });

  describe('under stormy conditions',function() {
    beforeEach(function() {
      weather.isStormy.and.returnValue(true);
    });
    it('does not clear planes for takeoff when stormy', function() {
      expect(function() {
         airport.clearForTakeoff(plane);
        }).toThrowError('Takeoff prohibited due to storm conditions');
    });
    it('does not clear planes for landing when stormy', function() {
      expect(function() {
        airport.clearForLanding(plane);
      }).toThrowError('Landing prohibited due to storm conditions');
    });
  });
});
