describe ("airport", function() {

  var airport;
  var plane;

  beforeEach(function(){
    airport = new Airport();
    plane = new Plane();
  });

  it("default_capacity defaults to 5", function(){
    expect(airport.DEFAULT_CAPACITY).toEqual(5);
  })

  it("hanger is an emtpy array", function(){
    expect(airport.hanger.length).toEqual(0);
  })

  it("lands plane and increases docked planes by 1", function(){
    airport.land(plane);
    expect(airport.hanger).toContain(plane);
  })

});