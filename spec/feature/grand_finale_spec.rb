require 'capybara/rspec'
require 'plane'
require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Planes can take off and land from airport' do
  scenario 'A plane is allowed to land at airport' do
    aeroplane = Plane.new
    airport = Airport.new
    airport.allow_landing(aeroplane)
  end

  scenario 'Plane is allowed to take off from airport' do
    aeroplane = Plane.new
    airport = Airport.new
    airport.allow_takeoff(aeroplane)
  end
end

# feature 'Grand Finale' do

#   xscenario 'all planes can land and all planes can take off'


