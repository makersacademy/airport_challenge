require 'airport'

describe Airport do

	it "responds to land" do
		expect(subject).to respond_to(:land).with(1).argument
	end

	it "checks whether a plane has landed at the airport or not" do
		plane = double(:plane)
		subject.land(plane)
		expect(subject.landed?(plane)).to eq(true)
	end

end