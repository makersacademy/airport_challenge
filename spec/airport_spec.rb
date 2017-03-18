require 'airport'


describe Airport do
  
	describe 
	it "instructs plane to land at airport" do
	  plane = double("plane")
	  expect(subject.grant_landing_permission(plane)).to eq plane
	end

  it "confirms that plane has landed" do
	  plane = Plane.new
	  subject.grant_landing_permission(plane)
	  expect(plane).to have_landed	
	end

	it "instructs plane to take off from airport" do
    plane = double("plane")
    expect(subject.grant_takeoff_permission(plane)).to eq plane
	end
	

end