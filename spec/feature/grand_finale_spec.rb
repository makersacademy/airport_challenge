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

	  scenario 'plane has landed' do
	  	plane = Plane.new
	  	plane.land Airport.new
	  	expect(plane).to be_landed
	  end
	end
	feature 'the plane takes off from the specified airport' do 
		scenario 'at Heathrow' do
			plane = Plane.new
			heatrhow = Airport.new
			plane.take_off heatrhow
			expect(plane.location).to eq heatrhow
		end
	end

	scenario 'plane takes off' do
		plane = Plane.new
		plane.take_off Airport.new
		expect(plane).not_to be_landed
	end
end










