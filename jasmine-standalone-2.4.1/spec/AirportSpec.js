describe ("airport when weather is not stormy", function() {

  var airport;
  var plane;

  beforeEach(function(){
    airport = new Airport();
    plane = new Plane();
    weather = new Weather();
    spyOn(Math, "random").and.returnValue(1);

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

  it("throws error if hanger is full", function(){
    for(i=1; i<=5;i++){airport.land(plane)};
    expect(function(){airport.land(plane)}).toThrow("Hanger is full");
  })

  it("cannot takeoff a plane when hanger is empty", function(){
    expect(function(){airport.takeoff(plane)}).toThrow("Hanger is empty");
  })

});

describe ("airport when weather is stormy", function() {

  var airport;
  var plane;

  beforeEach(function(){
    airport = new Airport();
    plane = new Plane();
    weather = new Weather();
    airport.land(plane);
    spyOn(Math, "random").and.returnValue(0);

  });

  it("cannot land plane", function(){
    expect(function(){airport.land(plane)}).toThrow("Weather is stormy");
  })

  it("cannot take off plane", function(){
    expect(function(){airport.takeoff(plane)}).toThrow("Weather is stormy");
  })

});

