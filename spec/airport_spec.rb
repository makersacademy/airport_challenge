require './lib/airport.rb'

describe Airport do

  it 'can land a plane' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    allow(airport).to receive(:stormy?) { false }
    airport.land_plane(plane)
    expect(airport.planes).to include(plane)
  end

  it 'can allow a plane to takeoff' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    allow(airport).to receive(:stormy?) { false }
    airport.land_plane(plane)
    allow(airport).to receive(:stormy?) { false }
    airport.takeoff_plane(plane)
    expect(airport.planes).to_not include(plane)
  end

  it 'Will not allow a plane to takeoff if it is stormy' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    allow(airport).to receive(:stormy?) { false }
    airport.land_plane(plane)
    allow(airport).to receive(:stormy?) { true }
    expect { airport.takeoff_plane(plane) }.to raise_error("We can't take off as it is stormy")
  end

  it 'Will not allow a plane to land if it is stormy' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    allow(airport).to receive(:stormy?) { true }
    expect { airport.land_plane(plane) }.to raise_error("We can't land as it is stormy")
  end

  it 'It will not allow a plane to land if the airport is full' do
    plane = Plane.new
    plane2 = Plane.new
    airport = Airport.new('Heathrow', 1)
    allow(airport).to receive(:stormy?) { false }
    airport.land_plane(plane)
    expect { airport.land_plane(plane2) }.to raise_error("We can't land as the airport is full")
  end

  it 'Allows the user to set airport capacity at creation' do
    airport = Airport.new('Heathrow', 15)
    airport2 = Airport.new('Gatwick')
    expect(airport.capacity).to eq 15
    expect(airport2.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "Raises an error if a plane that isn't at the airport is requested to take off" do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    allow(airport).to receive(:stormy?) { false }
    expect { airport.takeoff_plane(plane) }.to raise_error("That plane is not at this airport")
  end
end
