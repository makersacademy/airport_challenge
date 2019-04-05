require "airport"
require "plane"

describe Airport do

	it "allows planes to land" do
		expect(subject).to respond_to :land_a_plane
	end

	it "allows planes to take off" do
		expect(subject).to respond_to :take_off
	end

	describe "#take_off" do
		it "should release a plane" do
			expect(subject.take_off).to be_instance_of Plane
		end
	end

end