require 'airport'
require 'plane'

describe Airport do

  new_airport = Airport.new

  it 'responds to #landing' do
    expect(subject).to respond_to(:landing).with(1).argument
  end

  it 'stores the names of the planes landing in an array' do
    plane1 = Plane.new
    new_airport.landing(plane1)
    expect(new_airport.planes_on_ground).to eq ([plane1])
  end

  it 'does not let a plane already in the airport land again' do
    plane2 = Plane.new
    new_airport.landing(plane2)
    expect{new_airport.landing(plane2)}.to raise_error 'plane is already in the airport'
  end

  it 'removes a named plane from @planes_on_ground when it takes off and #stormy = false' do
    specific_plane = Plane.new
    new_airport.landing(specific_plane)
    new_airport.stormy = false
    expect(new_airport.take_off(specific_plane)).to eq (specific_plane)
  end

  it 'raises an error if a named plane from @planes_on_ground tries to take off and #stormy = true' do
    specific_plane = Plane.new
    new_airport.landing(specific_plane)
    new_airport.stormy = true
    expect{new_airport.take_off(specific_plane)}.to raise_error 'weather is stormy, plane can not take off'
  end

end
