require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  scenario 'all planes can land and all planes can take off' do
    plane = Plane.new
    expect(plane).to be_flying
  end

  scenario 'land plane at an approriate airport' do
    plane = Plane.new
    airport = Airport.new
    airport.land_plane(plane)
    expect(plane).to be_landed
  end
end
