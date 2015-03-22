require 'capybara/rspec'
require 'airport'

feature 'Basic Features: Plane' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  before { allow(airport).to receive(:stormy_weather?) { false } }
  scenario 'when created, it should be flying' do
    expect(plane.flying?).to be true
  end

  scenario 'it lands and then takes off from an airport in normal weather' do
    airport.land_plane(plane)
    airport.plane_take_off(plane)
    expect(plane.flying?).to be true
  end

  scenario 'when it lands, it should not be flying' do
    airport.land_plane(plane)
    expect(plane.flying?).to be false
  end

  scenario 'it tries to land, having already landed' do
    airport.land_plane(plane)
    expect { airport.land_plane(plane) }.to raise_error 'Already Landed'
  end

  scenario 'it tries to take off but is already flying' do
    airport.land_plane(plane)
    plane.take_off!
    expect { airport.plane_take_off(plane) }.to raise_error 'Already Flying'
  end
end
