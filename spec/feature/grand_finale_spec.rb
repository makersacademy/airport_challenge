require 'capybara/rspec'
require 'plane'
require 'airport'

feature 'Pilot can land his plane at airport'do
  scenario 'airport accepts request to land flying plane and lands plane'do
    airport = Airport.new
    plane = Plane.new
    airport.land plane
    expect(airport).not_to be_stormy
    expect(plane).to be_flying
  end

  scenario 'airport allows plane to take off if not stormy'do
  aiport = Airport.new
  airport.land Plane.new
  plane = airport.take-off
  expect(airport).not_to be_stormy
end


end


# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"
