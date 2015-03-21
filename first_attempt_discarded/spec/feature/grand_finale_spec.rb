require 'airport'
require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'for our airport to be operational' do
  scenario 'planes can land' do
    airport = Airport.new # an airport must exist
    airport.agree_take_off Plane.new 
    plane = airport.agree_land # a plane must exist and it must be flying
    expect(plane).not_to be_landed
  end
  # scenario 'airport cannot allow a plane to land if landed' do
  #  airport - Airport.new
  #  expect { airport.agree_land }.to raise_error 'Plane already landed.'
  # end
  xscenario 'all planes can take off' do
    # airport = Airport.new
    # plane = airport.agree_take_off
    # expect(plane).not_to be_flying
  end
  xscenario 'a plane cannot land when an airport is full'
  xscenario 'planes cannot land when the weather is stormy'

end
