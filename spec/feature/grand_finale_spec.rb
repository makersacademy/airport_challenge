require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  xscenario 'all planes can land and all planes can take off'

end

feature 'Plane can land' do
  scenario 'in an airport' do
    plane = Plane.new
    plane.land
    expect(plane::status).to eq "landed"
  end
end

feature 'Plane can' do
  scenario 'land and then take off'  do
    plane = Plane.new
    plane.land
    plane.take_off
    expect(plane::status).to eq "flying"
  end
end