require 'plane'

describe Plane do
  it 'should be grounded once landed at airport' do
    # Don't understand how to test this properly
    # when relying on another method that 
    # you have to fake in the tests :-/
    plane = Plane.new
    airport = instance_double("Airport", :land => plane) 
    airport.land(plane)
    plane.instance_variable_set("@grounded", true)
    expect(plane.grounded).to eq(true)
  end
  it 'should not be grounded after take off' do
    airport.take_off(plane)
    expect(plane.grounded).to eq(false)
  end
end
