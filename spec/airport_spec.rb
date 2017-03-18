require 'airport'


describe Airport do
	it {is_expected.to respond_to(:grant_landing_permission).with(1).argument }
	it {is_expected.to respond_to(:confirm_landing).with(1).argument }
	it {is_expected.to respond_to(:grant_takeoff_permission).with(1).argument }
  
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