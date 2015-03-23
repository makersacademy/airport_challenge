require 'plane'

describe Plane do
	let(:plane) {Plane.new}

	it "can have a flying status when created" do
		expect(plane).to be_flying
	end

	it "can have a flying status when in the air" do
		plane.takeoff!
		expect(plane).to be_flying
	end

	it "can takeoff" do
		plane.takeoff!
		expect(plane).to be_flying
	end

	it "can land" do
		plane.land!
		expect(plane).not_to be_flying  
	end
end
