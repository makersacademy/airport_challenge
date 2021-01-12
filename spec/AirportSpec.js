describe('Airport', function(){

  var airport;

  beforeEach(function () {
    airport = new Airport(); 
  });

  describe('instructs plane to land', function () {
    it("instructs a plane to land when flying", function(){
      expect(airport.land).toBe(true)
    })
  })
});