require 'Airport'


describe Airport do
	subject(:airport) {Airport.new}
	before(:each) do
		@plane = Plane.new
	end

	it "tests if a controller can instruct plane to land and confirm landing" do
		expect(airport.land(@plane)).to eq [airport.landed.last]
	end

	it "tests if a controller can instruct plane to takeoff and confirm it is no longer there" do
		airport.land(@plane)
		airport.takeoff(@plane)
		expect(airport.at_airport?(@plane)).to be false
	end
end