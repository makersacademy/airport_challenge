require 'airport'
describe Airport do

	describe "#land" do
		it "should be able to receive a plane" do
			expect(subject).to respond_to(:land).with(1).argument
		end
	end

	describe "#planes" do

		it "should return a list planes in the airport" do
			subject.land "plane 1"
			subject.land "plane 2"
			expect(subject.planes).to eq ["plane 1", "plane 2"]
		end

	end


end