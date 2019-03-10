require 'airport.rb'

describe Airport do

	it "airport class should exist" do
		expect(Airport.new.is_a?(Airport)).to eq true
	end

	it "airplane should be in the airport after landing" do
		airplane = Airplane.new
		airport = Airport.new

		airport.land(airplane)

		expect(airport.hangar).to include airplane
	end

	it "airplane should no longer be in the airport after taking off" do
		airplane = Airplane.new
		airport = Airport.new
		airport.land(airplane)

		airport.take_off(airplane)

		expect(airport.hangar).not_to include airplane
	end

	it "three airplanes land and the second takes off, second airplane should not be in airport after" do
		airplane1 = Airplane.new
		airplane2 = Airplane.new
		airplane3 = Airplane.new
		airport = Airport.new
		airport.land(airplane1)
		airport.land(airplane2)
		airport.land(airplane3)

		airport.take_off(airplane2)

		expect(airport.hangar).not_to include airplane2
		expect(airport.hangar).to include airplane1
		expect(airport.hangar).to include airplane3
	end
end
