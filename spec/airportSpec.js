'use strict'

describe('Airport', function() {
  var airport
  beforeEach(function() {
    airport = new Airport
  });
  it('is empty by default', function() {
    expect(airport.plane()).toEqual([])
  });
});
