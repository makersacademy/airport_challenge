require 'airport'


describe Airport do
  
	it "instructs plane to land at airport" do
	  plane = Plane.new
	  expect(subject.grant_landing_permission(plane)).to eq plane
	end

  it "confirms that plane has landed" do
	  plane = Plane.new
	  subject.grant_landing_permission(plane)
	  expect(plane).to have_landed	
	end
	
end