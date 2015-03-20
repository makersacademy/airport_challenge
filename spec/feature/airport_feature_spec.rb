require 'capybara/rspec'

feature 'a plane comes in to land' do
  scenario 'the plane tries to land, but the airport is full' do
    plane = Plane.new
    airport = Airport.new
    20.times { airport.land_plane(plane) }
    expect { airport.land_plane(plane) }.to raise_error 'Airport Full'
  end

  xscenario 'the plane tries to land, but the weather is stormy'

  scenario 'the plane lands at the airport' do
    plane = Plane.new
    airport = Airport.new
    expect(airport.land_plane(plane)).to be nil
  end

  scenario 'a plane takes off from the airport' do
    plane = Plane.new
    airport = Airport.new
    airport.land_plane(plane)
    expect(airport.plane_take_off).to eq plane
  end
end
