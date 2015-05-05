require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  scenario 'all planes can land and all planes can take off' do
    airport = Airport.new # initialize a new object, an instance of the Airport class
    planecome = airport.land # ask the airport to land a plane
    planego = airport.takeoff # ask the airport to let a plane takeoff
    expect(planecome).to arrive # expect the plane to respond to the method 'land?' with true
    expect(planego).to leave # expect the bike to respond to the method 'takeoff?' with true
  end
end