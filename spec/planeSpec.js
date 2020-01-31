'use strict'

describe('Plane', function() {
  var plane;
  beforeEach(function() {
    plane = new Plane
  });
  it('has plane to land at airport', function() {
    expect(plane.land).not.toBeUndefined()
  });
});
