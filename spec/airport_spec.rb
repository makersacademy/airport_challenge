require "airport"

describe Airport do

	it "allows planes to land" do
		expect(subject).to respond_to :land_a_plane
	end

	it "allows planes to take off" do
		expect(subject).to respond_to :take_off
	end

end