'use strict';

describe('Airport', function(){
  var airport;
  var plane;

  beforeEach(function(){
    airport = new Airport();
    plane = new Plane();
  });

  it('has no planes by default', function() {
    expect(airport.planes()).toEqual([]);
  });
  it('can clear planes for landing', function(){
    airport.clearForLanding(plane);
    expect(airport.planes()).toEqual([plane]);
  });
  it('can clear planes for takeoff', function() {
    airport.clearForLanding(plane);
    airport.clearForTakeOff(plane);
    expect(airport.planes()).toEqual([]);
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
});
