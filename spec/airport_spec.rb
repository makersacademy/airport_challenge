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

end
