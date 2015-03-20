require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  # A draft of the grand finale test, which doesn't work properly yet.
  # Main problem is that I can't make a variable 6 times in a row, and persist
  # it between different lines of code.
  xscenario 'all planes can land and all planes can take off' do
    airport = Airport.new
    plane = Plane.new
    6.times { airport.land_plane(plane) }
    6.times { airport.plane_take_off(plane) }
    expect(plane.take_off!).to raise_error 'Already Flying'
  end
end
