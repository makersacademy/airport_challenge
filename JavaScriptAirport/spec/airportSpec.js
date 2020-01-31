'use strict'
describe('Airport', function(){
  var airport;
  var plane;
  beforeEach(function(){
    airport = new Airport();
    plane = jasmine.createSpy('plane',['land']);
  });
  it('has no planes by default', function(){
    expect(airport.planes()).toEqual([]);
  });
  it('can clear planes for landing', function(){
    airport.clearForLanding(plane);
    expect(airport.planes()).toEqual([plane]);
  });

  it('can clear planes for takeoff', function(){
    airport.clearForLanding(plane);
    airport.clearForTakeoff(plane);
    expect(airport.planes()).toEqual([]);
  });

  describe('capacity', function(){
    it('responds to capacity', function(){
      expect(airport.capacity).not.toBeUndefined();
    });

    it('sets default capacity', function(){
      expect(airport.DEFAULT_CAPACITY).toEqual(20)
    });

    it('raises an error if full', function(){
      airport.capacity = 1;
      airport.clearForLanding(plane);
      expect(function(){
        airport.clearForLanding(plane);
      }).toThrowError("Airport Full!");
    });

    it('raises an error if empty', function(){
      expect(function(){
        airport.clearForTakeoff(plane);
      }).toThrowError("Airport Empty!");
    });
  });
});
