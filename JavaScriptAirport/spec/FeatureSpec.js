'use strict';
describe('Feature Test', function (){
  var plane;
  var airport;

  beforeEach(function(){
    plane = new Plane();
    airport = new Airport();
  });
  it('allows planes to land at the airport', function(){
    plane.land(airport);
    expect(airport.planes()).toContain(plane)
  });
  it('planes can takeoff', function(){
    plane.land(airport);
    plane.takeoff(airport);
    expect(airport.planes()).not.toContain(plane);
  });

  it('stops planes from taking off when weather is stormy', function(){
    plane.land(airport);
    spyOn(airport, 'isStormy').and.returnValue(true);
    expect(function(){
      plane.takeoff(airport);
    }).toThrowError('Takeoff prohibited due to storm conditions');
    expect(airport.planes()).toContain(plane);
  });

  it('stops planes from landing when weather is stormy', function(){
    spyOn(airport, 'isStormy').and.returnValue(true);
    expect(function(){
      plane.land(airport);
    }).toThrowError('Landing prohibited due to storm conditions');
    expect(airport.planes()).not.toContain(plane);
  });
});
