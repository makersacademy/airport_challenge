require 'capybara/rspec'
require 'airport'

feature 'Basic Features: Airport' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  scenario 'the plane tries to land, but the airport is full' do
    20.times { airport.land_plane(Plane.new) }
    expect { airport.land_plane(plane) }.to raise_error 'Airport Full'
  end

  xscenario 'the plane tries to land, but the weather is stormy'

  scenario 'the plane lands at the airport' do
    expect(airport.land_plane(plane)).to eq [plane]
  end

  scenario 'the plane takes off from the airport' do
    airport.land_plane(plane)
    expect(airport.plane_take_off(plane)).to eq plane
  end
end
