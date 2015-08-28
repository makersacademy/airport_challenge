require 'capybara/rspec'
require 'airport'
require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Air Traffic Control' do


  scenario 'planes can land at the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land plane
    expect(plane).to be_landed
  end

  scenario 'planes can take off from the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land plane
    airport.take_off plane
    expect(plane).to be_flying
  end
end