require 'airport'

describe Airport do 
it "responds to plane_land" do
	expect(subject).to respond to :plane_land
end
end