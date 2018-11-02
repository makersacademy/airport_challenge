require 'airport'
require 'plane'
require 'weather'

describe Airport do
	let(:plane) 	{plane = Plane.new}
	let(:airport) {airport = Airport.new}
	let(:weather_sunny)		{weather = Weather.new.generate_weather(10)}

	describe '#confirm_departure' do
		it 'checks that a plane is no longer in the airport' do
			plane.land_at_airport(airport, weather_sunny)
			plane.takeoff_from_airport(airport, weather_sunny)
			airport.confirm_departure(plane)

			expect(airport.planes_present).not_to include(plane)
		end
	end

	describe '#full?' do
		it 'checks airport capacity and returns true if full' do
			Airport::DEFAULT_CAPACITY.times {plane = Plane.new.land_at_airport(airport, weather_sunny)}
			expect {plane.land_at_airport(airport, weather_sunny)}.to raise_error("Danger airport full")
		end
	end

	describe '#full?' do
		it 'checks airport capacity and returns false if not full' do
		end
	end
end