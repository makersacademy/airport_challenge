require 'capybara/rspec'
require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'plane status' do
  scenario 'plane has landed' do
    plane = Plane.new
    expect(plane.landed?).to eq true
  end
  scenario 'plane has taken off' do
    plane = Plane.new
    expect(plane.taken_off).to eq false
  end
end
