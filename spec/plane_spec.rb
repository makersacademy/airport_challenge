require 'plane'
require 'airport'
require 'weather'

describe Plane do
	let(:plane) 					{plane = Plane.new}
	let(:airport) 				{airport = Airport.new}
	let(:weather_sunny)		{weather = Weather.new.generate_weather(10)}
	let(:weather_stormy)	{weather = Weather.new.generate_weather(3)}

	describe '#land_at_airport' do
		it 'checks plane stored as instance variable when landed' do
			plane.land_at_airport(airport, weather_sunny)

			expect(airport.planes_present).to include(plane)
		end
	end

	describe '#takeoff_from_airport' do
		it 'takes off from the passed airport' do
			plane.land_at_airport(airport, weather_sunny)
			plane.takeoff_from_airport(airport, weather_sunny)

			expect(airport.planes_present).not_to include(plane)
		end
	end

	describe 'stormy weather takeoff' do
		it 'plane should not takeoff when weather is stormy' do
			expect {plane.takeoff_from_airport(airport, weather_stormy)}.to raise_error("Danger stormy weather")
		end
	end
end