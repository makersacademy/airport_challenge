require 'airport'
require 'plane'
require 'capybara/rspec'

feature 'Stormy City Airport Rush Hour' do

	stormy_airport = Airport.new

	scenario 'A new Airport object was created' do
		expect(stormy_airport.class).to eq(Airport) 
	end

	created_planes = []
	20.times{created_planes << Plane.new}

	scenario '20 Plane objects were created' do
		all_planes = true; i = 0
		20.times do
			all_planes = false unless created_planes[i].class == Plane
			i += 1		
		end
		all_planes = false unless created_planes.length == 20
		expect(all_planes).to eq(true)
	end

end