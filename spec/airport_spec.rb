require 'airport'
require 'plane'

describe Airport do

  it 'allows a plane to land at the airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

=begin
  As an air traffic controller 
  So I can get passengers on the way to their destination 
  I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
=end

  it 'allows a plane to take off from the airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq plane
  end

  it 'doesn\'t allow a plane to land if airport capacity reached' do
    Airport::DEFAULT_CAPACITY.times {subject.land(Plane.new)}
    expect { subject.land(Plane.new) }.to raise_error 'No capacity at airport'
  end

  it 'default plane capacity can be overwritten' do
    airport = Airport.new(1)
    expect(airport.plane_capacity).to eq 1
  end

=begin
  As an air traffic controller 
  To ensure safety 
  I want to prevent takeoff when weather is stormy 
=end

end