require 'airport'

describe Airport do


	describe "#landing" do

		it "responds to land a plane" do
			expect(subject).to respond_to(:land).with(1).argument
		end

		it "checks whether a plane has landed at the airport or not" do
			allow(subject).to receive(:stormy?).and_return(false)
			plane = double(:plane)
			subject.land(plane)
			expect(subject.landed?(plane)).to eq(true)
		end

		it "does not let a plane land if the weather is bad" do
			allow(subject).to receive(:stormy?).and_return(true)
			expect {subject.land(double(:plane))}.to raise_error("It's too stormy to land a plane")
		end

		it "does not let a plane land if it is already at capacity" do
			allow(subject).to receive(:full?).and_return(true)
			allow(subject).to receive(:stormy?).and_return(false)
			expect {subject.land(double(:plane))}.to raise_error("The airport is already full")
		end

	end


	describe "#takeoff" do 

		it "airport responds to takeoff plane" do
			expect(subject).to respond_to(:takeoff).with(1).argument
		end

		it "confirm that the plane is no longer at the airport" do
			allow(subject).to receive(:stormy?).and_return(false)
			plane = double(:plane)
			subject.takeoff(plane)
			expect(subject.left_airport?(plane)).to eq(true)
		end

		it "does not let a plane takeoff if the weather is bad" do
			allow(subject).to receive(:stormy?).and_return(true)
			expect {subject.takeoff(double(:plane))}.to raise_error("It's too stormy to take off")
		end

	end
end