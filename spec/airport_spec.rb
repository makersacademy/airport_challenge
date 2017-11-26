require 'airport'
describe Airport do

	let :plane {double(:plane, land: nil, take_off: nil)}

	describe "#land" do
		it "should be able to receive a plane" do
			expect(subject).to respond_to(:land).with(1).argument
		end
		it "shouldn't be able to land any planes if the airport is full" do
			subject.capacity.times {subject.land plane}
			expect {subject.land(plane)}.to raise_error "Airport Full, Cannot Land"
		end
	end

	describe "#planes" do

		it "should return a list planes in the airport" do
			subject.land plane
			subject.land plane
			expect(subject.planes).to eq [plane, plane]
		end

	end

	describe "#release_for_takeoff" do
		it "should return a plane, and the plane should no longer be in the airport" do
			subject.land plane
			expect(subject.release_for_takeoff plane).to eq plane
			expect(subject.planes).to eq []
		end
		it "should cause the plane to take off" do
			subject.land plane
			expect(plane).to receive(:take_off)
			subject.release_for_takeoff plane
		end
		it "should raise an error if trying to release a plane for takeoff that is not in the airport" do
			expect{subject.release_for_takeoff plane}.to raise_error "Plane Not Here"
		end
	end

	describe "#expecting?" do
		it "should return false when a plane is not expected for landing" do
			expect(subject.expecting? plane).to eq false
		end
	end

	describe "#released_for_takeoff?" do
		it "should return false when a plane has not been released for takeoff" do 
			expect(subject.released_for_takeoff? plane).to eq false
		end
	end
end