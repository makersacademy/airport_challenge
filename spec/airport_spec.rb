require 'airport.rb'

describe Airport do
  it 'instructs a plane to land' do
    airport = Airport.new
    allow(airport).to receive(:weathergood?) { true }
    plane = Plane.new
    airport.land_plane(plane)
    expect(airport.planes).to include(plane)
  end

  it 'instructs a plane to take off and confirm that it is no longer in the airport' do
    airport = Airport.new
    allow(airport).to receive(:weathergood?) { true }
    plane = Plane.new
    airport.land_plane(plane)
    expect(airport.take_off(plane)).to be plane
    expect(airport.planes).to be_empty
    expect(plane.landing_airport).to equal nil
  end

  it 'should have a default capacity and raise error if asked to land more planes' do
    airport = Airport.new
    allow(airport).to receive(:weathergood?) { true }
    Airport::DEFAULT_CAPACITY.times do
      airport.land_plane(Plane.new)
    end
    expect { airport.land_plane(Plane.new) }.to raise_error "The airport is full"

  end

  it 'should be created with an override capacity if passed in and allow as many planes as its defined capacity to land ' do
    airport = Airport.new(2)
    plane = Plane.new
    allow(airport).to receive(:weathergood?) { true }
    airport.land_plane(plane)
    another_plane = Plane.new
    airport.land_plane(another_plane)
    expect(airport.planes).to include(plane)
    expect(airport.planes).to include(another_plane)
  end

  it 'should not allow landing of a plane if the weather is stormy' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:weathergood?) { false }
    expect { airport.land_plane(plane) }.to raise_error "Weather does not allow landing"
  end

  it 'ensures that a plane can take off from the airport if it is not at the airport' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:weathergood?) { true }
    airport.land_plane(plane)
    another_plane = Plane.new
    expect { airport.take_off(another_plane) }.to raise_error "Plane not at this airport"

  end

  it 'ensures that a plane can take off from the airport if it is at the airport' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:weathergood?) { true }
    airport.land_plane(plane)
    expect(airport.take_off(plane)).to equal plane
    expect(airport.planes).not_to include(plane)

  end

  it 'ensures that a plane can be landed at an airport if it not already at the airport' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:weathergood?) { true }
    airport.land_plane(plane)
    expect { airport.land_plane(plane) }.to raise_error "Plane already landed at this airport"

  end

  it 'ensures that a plane that has already landed at an airport cannot be landed again at another airport' do
    airport = Airport.new
    another_airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:weathergood?) { true }
    allow(another_airport).to receive(:weathergood?) { true }
    airport.land_plane(plane)
    expect { another_airport.land_plane(plane) }.to raise_error "Plane at another airport"

  end

end
