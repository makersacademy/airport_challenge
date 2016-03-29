describe ("airport", function() {

  var airport;

  beforeEach(function(){
    airport = new Airport();
  });

  it("default_capacity defaults to 5", function(){
    expect(airport.DEFAULT_CAPACITY).toEqual(5);
  })

  it("airplanes is an emtpy array", function(){
    expect(airport.airplanes.length).toEqual(0);
  })

  it("lands plane and increases docked planes by 1", function(){
    airport.land(plane)
    expect(airport.airplanes.length).toEqual(1);
  })

});