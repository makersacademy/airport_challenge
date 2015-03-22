require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'as a pilot i want' do

  scenario 'to be able to land my plane' do
    plane = Plane.new
    expect(plane).to respond_to :land
  end

  xscenario 'to be able to take off my plane' do
  end

end

feature 'as the airport i want' do

  xscenario 'to be able to approve each plane landing' do
  end

  xscenario 'to be able to approve each plane taking off' do
  end

end
