require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  xscenario 'all planes can land and all planes can take off' do 
  	airport = Airport.new
  	6.times{airport.land Plane.new}
  	#how do you separately check the status of each plane as landed
  	#how do I test the storm parameter
  	6.times{airport.release}
  	#how do you separately check the status of each plane as flying again
 	end

end
