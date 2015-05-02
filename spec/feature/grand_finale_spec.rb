require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Planes can take off and land from airport' do
  scenario 'Plane takes off from airport' do
    airport = Airport.new
    plane = airport.allow_takeoff
  end

  scenario 'A plane lands at airport' do
    airport = Airport.new
    plane = airport.allow_landing
  end
end
# feature 'Grand Finale' do

#   xscenario 'all planes can land and all planes can take off'

# end
