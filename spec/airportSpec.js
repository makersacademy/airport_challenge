describe('airport', function() {
  let airport;
  let plane;

  beforeEach(function() {
    airport = new Airport();
    plane = new Plane();
  });

  describe('runway', function() {
    it('has no planes by default', function() {
      expect(airport.runway).toEqual([]);
    });
  });

  describe('land', function() {
    it('can land at an airport', function() {
      expect(airport.land).not.toBeUndefined();
    });

    it('a plane can land', function() {
      spyOn(airport, 'isStormy').and.returnValue(false);
      airport.land(plane)
      expect(airport.runway).toEqual([plane]);
    });

    it('throws error if airport has reached capacity', function() {
      spyOn(airport, 'isStormy').and.returnValue(false);
      airport.capacity = 1;
      airport.land(plane);
      expect( function() { airport.land(plane); } ).toThrow(new Error('Airport Full'));
    });
  });

  describe('takeoff', function() {
    it('can takeoff from the airport', function() {
      expect(airport.takeoff).not.toBeUndefined();
    });

    it('throws error if no planes to takeoff', function() {
      spyOn(airport, 'isStormy').and.returnValue(false);
      expect(airport.runway).toEqual([])
      expect( function() { airport.takeoff(); } ).toThrow(new Error('Airport Empty'));
    });

    it('a plane can takeoff', function() {
      spyOn(airport, 'isStormy').and.returnValue(false);
      airport.land(plane);
      airport.takeoff();
      expect(airport.runway).not.toContain(plane);
    });
  });

  describe('capacity', function() {
    it('has a capcity', function() {
      expect(airport.capacity).not.toBeUndefined();
    });

    it('has a default capacity of 20', function() {
      expect(airport.capacity).toEqual(20);
    });

    it('has a variable capacity', function() {
      airport.capacity = 30;
      expect(airport.capacity).toEqual(30);
    });
  });

  describe('weather', function() {
    it('has an isStormy function', function() {
      expect(airport.isStormy()).not.toBeUndefined();
    });

    it('stops takeoff when weather is stormy', function() {
      airport.land(plane);
      spyOn(airport, 'isStormy').and.returnValue(true);
      expect( function() { airport.takeoff(); } ).toThrow(new Error('Cannot Takeoff In This Weather'));
      expect(airport.runway).toContain(plane);
    });

    it('allows takeoff when weather is not stormy', function() {
      spyOn(airport, 'isStormy').and.returnValue(false);
      airport.land(plane);
      airport.takeoff();
      expect(airport.runway).not.toContain(plane);
    });
  });

  it('stops landing when weather is stormy', function() {
    spyOn(airport, 'isStormy').and.returnValue(true);
    expect( function() { airport.land(plane); } ).toThrow(new Error('Cannot Land In This Weather'));
  });

  it('allows landing when weather is not stormy', function() {
    spyOn(airport, 'isStormy').and.returnValue(false);
    airport.land(plane);
    expect(airport.runway).toEqual([plane]);
  });
});