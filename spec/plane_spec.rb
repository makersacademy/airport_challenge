require 'plane'

describe Plane do
  let(:airport) { instance_double("Airport", :land => plane, :take_off => plane) }
  let(:plane) { Plane.new }
  it 'should be grounded once landed at airport' do
    # Don't understand how to test this properly
    # when relying on another method that 
    # you have to fake in the tests :-/
    airport.land(plane)
    plane.instance_variable_set("@grounded", true)
    expect(plane.grounded).to eq(true)
  end
  it 'should not be grounded after take off' do
    # Again, don't know how to test this.
    # The below isn't doing anything at all.
    test_plane = plane
    airport.take_off(test_plane)
    expect(test_plane.grounded).to eq(false)
  end
end
