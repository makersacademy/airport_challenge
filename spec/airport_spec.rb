require 'airport'

describe Airport do 

	let(:plane) { double :plane }

	it {is_expected.to respond_to(:land).with(1).argument}

	describe "#land" do
		
		it "is expected to land a plane" do
			plane 
			subject.land(plane)
			expect(plane).to eq subject.planes.last
		end 
		it "can confirm landing" do
			plane 
			allow(plane).to receive(:status).and_return("Landed")
			expect(plane.status).to eq ("Landed")
		end 
	end 

end 