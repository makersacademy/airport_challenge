require 'airport'
describe Airport do

	let :plane {double(:plane)}

	describe "#land" do
		it "should be able to receive a plane" do
			expect(subject).to respond_to(:land).with(1).argument
		end
	end

	describe "#planes" do

		it "should return a list planes in the airport" do
			subject.land plane
			subject.land plane
			expect(subject.planes).to eq [plane, plane]
		end

	end

	describe "#release" do
		it "should return a plane, and the plane should no longer be in the airport" do
			subject.land plane
			expect(subject.release plane).to eq plane
			expect(subject.planes).to eq []
		end


	end



end