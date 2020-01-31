'use strict'
describe('Airport', function(){
  var airport;
  beforeEach(function(){
    airport = new Airport();
  });
  it('can land at airport', function() {
    expect(airport.land).not.toBeUndefined()
  });
  it('has no planes by default', function(){
    expect(airport.planes()).toEqual([]);
  });
});
