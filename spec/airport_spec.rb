require 'airport'

describe Airport do


	describe "#landing" do

		it "responds to land a plane" do
			expect(subject).to respond_to(:land).with(1).argument
		end

		it "checks whether a plane has landed at the airport or not" do
			plane = double(:plane)
			subject.land(plane)
			expect(subject.landed?(plane)).to eq(true)
		end
	end


	describe "#takeoff" do 

		it "airport responds to takeoff plane" do
			expect(subject).to respond_to(:takeoff).with(1).argument
		end

		it "confirm that the plane is no longer at the airport" do
			plane = double(:plane)
			subject.takeoff(plane)
			expect(subject.left_airport?(plane)).to eq(true)
		end

	end
end