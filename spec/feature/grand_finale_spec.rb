require 'capybara/rspec'
require 'Airport'
require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

#feature 'Grand Finale' do

  #scenario 'all planes can land and all planes can take off' do


  feature 'Plane can land' do
    scenario 'at the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.can_receive(plane)
    expect(plane.land(status)).to eq "landed"
  end
end

