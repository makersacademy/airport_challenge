require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
	let (:airport) {Airport.new}
  scenario 'all planes can land and all planes can take off' do 
  	allow(airport).to receive(:stormy?).and_return(false)
  	6.times{airport.land Plane.new}
  	airport.planes.each{|plane| expect(plane).not_to be_flying}
  	6.times{airport.release}
  	airport.planes.each{|plane| expect(plane).to be_flying}
 	end

end
