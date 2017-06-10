require 'airport'

describe Airport do 

	it {is_expected.to respond_to(:land).with(1).argument}

	describe "#land" do
		it "is expected to land a plane" do
			plane = Plane.new
			subject.land(plane)
			expect(plane).to eq subject.planes.last
		end 
	end 
	
end 