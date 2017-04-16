require 'Airport'


describe 'Features' do
	subject(:airport) {Airport.new}
	before(:each) do
		@plane = Plane.new
	end

	it "A controller can instruct plane to land and confirm landing" do
		airport.land(@plane)
		expect(airport.at_airport?(@plane)).to be true
	end

	it "A controller can instruct plane to takeoff and confirm it is no longer there" do
		airport.land(@plane)
		airport.takeoff(@plane)
		expect(airport.at_airport?(@plane)).to be false
	end
end