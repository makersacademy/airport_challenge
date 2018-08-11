require 'airport'
require 'plane'

describe Airport do

  it 'responds to #landing' do
    expect(subject).to respond_to(:landing).with(1).argument
  end

  it 'stores the names of the planes landing in an array' do
    new_airport = Airport.new
    plane = Plane.new
    new_airport.stormy = false
    new_airport.landing(plane)
    expect(new_airport.planes_on_ground).to eq [plane]
  end

  it 'does not let a plane already in the airport land again' do
    new_airport = Airport.new
    plane = Plane.new
    new_airport.stormy = false
    new_airport.landing(plane)
    expect { new_airport.landing(plane) }.to raise_error 'plane is already in the airport'
  end

  it 'does not let a plane take off if it is not in the airport' do
    new_airport = Airport.new
    plane = Plane.new
    expect { new_airport.take_off(plane) }.to raise_error 'plane is not currently at this airport'
  end

  it 'removes a named plane from @planes_on_ground when it takes off and #stormy = false' do
    new_airport = Airport.new
    specific_plane = Plane.new
    new_airport.stormy = false
    new_airport.landing(specific_plane)
    expect(new_airport.take_off(specific_plane)).to eq specific_plane
  end

  it 'raises an error if a named plane from @planes_on_ground tries to take off and #stormy == true' do
    new_airport = Airport.new
    specific_plane = Plane.new
    new_airport.stormy = false # changed to false so specific_plane can land
    new_airport.landing(specific_plane)
    new_airport.stormy = true
    expect { new_airport.take_off(specific_plane) }.to raise_error 'weather is stormy, plane can not take off'
  end

  it 'adds a named plane to @planes_on_ground array when it lands and #stormy == false' do
    new_airport = Airport.new
    specific_plane = Plane.new
    new_airport.stormy = false
    expect(new_airport.landing(specific_plane)).to eq [specific_plane]
  end

  it 'raises an error if a named plane tries to land and #stormy == true' do
    new_airport = Airport.new
    specific_plane = Plane.new
    new_airport.stormy = true
    expect { new_airport.landing(specific_plane) }.to raise_error 'landing denied, weather is stormy'
  end

end
