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
  describe('under normal conditions', function() {
    beforeEach(function() {
      spyOn(airport, 'isStormy').and.returnValue(false);
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
  describe('checks for stormy conditions', function() {
    it('is stormy sometimes', function() {
      spyOn(Math, 'random').and.returnValue(1);
      expect(airport.isStormy()).toBeTruthy();
    });
    it('is not stormy other times', function() {
      spyOn(Math, 'random').and.returnValue(0);
      expect(airport.isStormy()).toBeFalsy();
    });
  });
  describe('under stormy conditions', function() {
    it('does not clear planes for takeoff', function() {
      spyOn(airport, 'isStormy').and.returnValue(true);
      expect(function(){ airport.clearForTakeOff(plane);}).toThrowError('Cannot takeoff plane. The weather is stormy.');
    });
  });
});
