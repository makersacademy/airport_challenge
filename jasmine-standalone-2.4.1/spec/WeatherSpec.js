describe ("weather", function(){

  var weather;

  beforeEach(function(){
    weather = new Weather();
  })

  it("return random number from 1..10", function(){
    spyOn(Math, "random").and.returnValue(0.4);
      expect(weather.random()).toEqual(5);
  })

  it("is stormy", function(){
    spyOn(Math, "random").and.returnValue(0);
    expect(weather.random()).toEqual(1);
    expect(weather.stormy()).toEqual(true);
  })

})