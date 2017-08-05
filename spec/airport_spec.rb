require "airport_challenge"

describe Airport do
	let(:plane) { double (:plane) }

	it "should respond to plane" do
		plane = double(:plane)
		airport = Airport.new
	end

	it "should respond to land method" do
		airport = Airport.new
		plane = double(:plane)
		airport.land(:plane)
		expect(subject).to respond_to(:land).with(1).argument
	end

	it "should respond to take_off method" do
		airport = Airport.new
		plane = double(:plane)
		airport.take_off(:plane)
		expect(subject).to respond_to(:take_off).with(1).argument
	end

end