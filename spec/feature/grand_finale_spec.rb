require 'capybara/rspec'
require 'airport'


## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  scenario 'a flying plane can land at an airport and then takeoff' do
  airport = Airport.new
  plane = Plane.new
	airport.land plane
  expect(plane).to be_landed
	airport.takeoff plane
	expect(plane).to be_flying
  end

  scenario "An error is raised if a pilot tries to land at a full airport" do
  	airport = Airport.new
  	plane = Plane.new
  	7.times {airport.land plane}
  	expect { airport.land plane }.to raise_error 'Airport full, remain in stack'
  end

=begin
  scenario 'An error is raised if the weather is stormy' do
  	airport = Airport.new
  	plane = Plane.new
  	expect {airport.land plane }.to raise_error 'Weather stormy, proceed to alternate airport'
 end
=end

end
