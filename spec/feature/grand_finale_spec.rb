require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'As a pilot' do

  scenario 'I would like to land my plane at an appropriate airport' do
    plane = Plane.new
    expect(plane).to be_flying
    airport = Airport.new
    airport.land(plane)
  end
end
