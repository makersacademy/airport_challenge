require 'airport'
## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do


	feature 'the plane lands at the specified airport' do

	  scenario 'at Luton' do
		plane = Plane.new
		luton = Airport.new
		plane.land luton
		expect(plane.location).to eq luton
	    end
	end
end
