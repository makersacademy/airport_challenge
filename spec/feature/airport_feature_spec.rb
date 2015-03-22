require 'capybara/rspec'
require 'airport'

feature 'Basic Features: Airport' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  before { allow(airport).to receive(:stormy_weather?) { false } }
  scenario 'the plane tries to land, but the airport is full' do
    20.times { airport.land_plane(Plane.new) }
    expect { airport.land_plane(plane) }.to raise_error 'Airport Full'
  end

  scenario 'the plane lands at the airport' do
    expect(airport.land_plane(plane)).to eq [plane]
  end

  scenario 'the plane takes off from the airport' do
    airport.land_plane(plane)
    expect(airport.plane_take_off(plane)).to eq plane
  end

  scenario 'a plane tries to land, but the weather is stormy' do
    stormy_airport = Airport.new
    allow(stormy_airport).to receive(:stormy_weather?) { true }
    expect { stormy_airport.land_plane(plane) }.to raise_error 'Stormy Weather'
  end

  scenario 'a plane tries to take off, but the weather is stormy' do
    airport.land_plane(plane)
    allow(airport).to receive(:stormy_weather?) { true }
    expect { airport.plane_take_off(plane) }.to raise_error 'Stormy Weather'
  end
end
