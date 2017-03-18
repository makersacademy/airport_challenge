require 'airport'


describe Airport do
  
	it "instructs plane to land at airport" do
	  plane = Plane.new
	  expect(subject.grant_landing_permission(plane)).to eq plane
	end


	
end