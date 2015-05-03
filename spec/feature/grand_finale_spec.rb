require 'capybara/rspec'
require 'plane'
require 'airport'

feature 'Pilot can land his plane at airport'do
  scenario 'airport accepts request to land flying plane and lands plane'do
    airport = Airport.new
    plane = airport.land
    expect(plane).to be_flying
  end
end


# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"
