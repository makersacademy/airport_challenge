require 'capybara/rspec'
require 'plane'

# Make sure you test all this in irb to check dependencies etc are all working

feature 'Feature: A plane comes in to land' do
  scenario 'when created, it should be flying' do
    plane = Plane.new
    expect(plane.flying?).to be true
  end
  scenario 'when it lands, it should not be flying' do
    plane = Plane.new
    airport = Airport.new
    airport.land_plane(plane)
    expect(plane.flying?).to be false
  end
  scenario 'it tries to land, having already landed' do
    plane = Plane.new
    airport = Airport.new
    airport.land_plane(plane)
    expect { airport.land_plane(plane) }.to raise_error 'Already Landed'
  end
end

feature 'Feature: A plane takes off' do
  scenario 'it lands and then takes off from an airport in normal weather' do
    plane = Plane.new
    airport = Airport.new
    airport.land_plane(plane)
    airport.plane_take_off
    expect(plane.flying?).to be true
  end

  scenario 'it tries to take off but is already flying' do
    plane = Plane.new
    airport = Airport.new
    airport.land_plane(plane)
    plane.take_off!
    expect { airport.plane_take_off }.to raise_error 'Already Flying'
  end
end
