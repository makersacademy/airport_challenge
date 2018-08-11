require 'airport'
require 'plane'

describe Airport do

  it 'stores the names of the planes landing in an array' do
    new_airport = Airport.new
    plane = Plane.new
    allow(new_airport).to receive(:stormy_weather) { false }
    new_airport.landing(plane)
    expect(new_airport.planes_on_ground).to eq [plane]
  end

  it 'does not let a plane already in the airport land again' do
    new_airport = Airport.new
    plane = Plane.new
    allow(new_airport).to receive(:stormy_weather) { false }
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
    allow(new_airport).to receive(:stormy_weather) { false }
    new_airport.landing(specific_plane)
    expect(new_airport.take_off(specific_plane)).to eq specific_plane
  end

  it 'raises an error if a named plane from @planes_on_ground tries to take off and #stormy == true' do
    new_airport = Airport.new
    specific_plane = Plane.new
    allow(new_airport).to receive(:stormy_weather) { false }
    new_airport.landing(specific_plane)
    allow(new_airport).to receive(:stormy_weather) { true }
    expect { new_airport.take_off(specific_plane) }.to raise_error 'weather is stormy, plane can not take off'
  end

  it 'adds a named plane to @planes_on_ground array when it lands and #stormy == false' do
    new_airport = Airport.new
    specific_plane = Plane.new
    allow(new_airport).to receive(:stormy_weather) { false }
    expect(new_airport.landing(specific_plane)).to eq [specific_plane]
  end

  it 'raises an error if a named plane tries to land and #stormy == true' do
    new_airport = Airport.new
    specific_plane = Plane.new
    allow(new_airport).to receive(:stormy_weather) { true }
    expect { new_airport.landing(specific_plane) }.to raise_error 'landing denied, weather is stormy'
  end

  it 'creates a default capacity of 8 for the number of planes it can hold' do
    new_airport = Airport.new
    expect(new_airport.capacity).to eq(8)
  end

  it 'denies a plane landing if the airport is at capacity' do
    new_airport = Airport.new
    new_plane = Plane.new
    new_airport.planes_on_ground = [*1..8] # replaced numbers for planes
    expect { new_airport.landing(new_plane) }.to raise_error 'landing denied, airport full'
  end

end
