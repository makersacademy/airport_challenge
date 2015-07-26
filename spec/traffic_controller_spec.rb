require 'traffic_controller'

describe TrafficController do 

	context 'when created' do 
		it 'has an airport location' do
			airport = Airport.new
			traffic_controller = TrafficController.new(airport) 
			expect(traffic_controller.location).to be_a Airport
		end
	end

	it 'can grant permission to pilots to land' do 
		airport = Airport.new
		airport.stub(:weather).and_return("Glorious sunshine")
		plane = Plane.new(airport)
		plane.pilot.request_to_land(airport)

		expect(plane.pilot.permission_to_land).to be true
	end

	it 'has a weather generator method' do 
		airport = Airport.new
		expect(airport.traffic_controller).to respond_to :generate_weather
	end

	context 'when weather generator method is run' do 
		it 'a string is returned' do
			airport = Airport.new
			expect(airport.traffic_controller.generate_weather).to be_a String
		end

		it "that string becomes the airport's weather" do
			airport = Airport.new
			weather = airport.traffic_controller.generate_weather
			expect(airport.weather).to be weather
		end
	end

	context 'when asked for permission to land' do
		it 'refuses if airport is full' do 
			airport = Airport.new
			airport.stub(:weather).and_return("Glorious sunshine")
			
			5.times do
				plane = Plane.new(airport)
				plane.pilot.request_to_land(airport)
				plane.pilot.land_plane(airport)
			end

			plane = Plane.new(airport)
			expect{plane.pilot.request_to_land(airport)}.to raise_error "Permission to land denied"
		end

		it "refuses if its airport is not the pilot's plane's current set destination" do 
			airport = Airport.new
			airport2 = Airport.new
			plane = Plane.new(airport)
			expect{plane.pilot.request_to_land(airport2)}.to raise_error "Permission to land denied"		
		end

		it "refuses if weather is stormy" do 
			airport = Airport.new
			plane = Plane.new(airport)
			airport.stub(:weather).and_return("Stormy, like hell on earth")

			expect{plane.pilot.request_to_land(airport)}.to raise_error "Permission to land denied"
		end
	end
end