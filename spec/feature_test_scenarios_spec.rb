require 'airport'
require 'plane'
require 'capybara/rspec'

feature 'Stormy City Airport Rush Hour' do

	airport = Airport.new

	scenario 'A new Airport object was created' do
		expect(airport.class).to eq(Airport) 
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

	scenario 'All created planes are all flying' do
		all_flying = true; i = 0
		created_planes.length.times do
			all_flying = false unless created_planes[i].flying
			i += 1		
		end
		expect(all_flying).to eq(true)
	end	

	scenario "Planes can't land at the airport if weather is stormy" do
		allow(airport).to receive(:weather).and_return('stormy')
		expect{created_planes.first.land(airport)}.to raise_error 'Stormy weather'
	end

	scenario "Planes can't land at the airport if airport is full" do
		allow(airport).to receive(:weather).and_return('sunny')
		airport.capacity.times do
			created_planes.last.land(airport)
			created_planes.pop
		end
		expect{created_planes.last.land(airport)}.to raise_error 'Airport full'
	end

	scenario "All planes landed at the airport are no longer flying" do
		all_not_flying = true; i = 0
		10.times do
			all_not_flying = false if airport.planes[i].flying
			i += 1		
		end
		expect(all_not_flying).to eq(true)
	end

	scenario "Planes can't take off from the airport if weather is stormy" do
		allow(airport).to receive(:weather).and_return('stormy')		
		expect{airport.planes.first.take_off}.to raise_error 'Stormy'
	end

	scenario "Five planes takes off from the airport in sunny weather" do
		allow(airport).to receive(:weather).and_return('sunny')		
		5.times{airport.planes.first.take_off}
		expect(airport.planes.count).to eq(5)
	end

end