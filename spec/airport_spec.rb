require 'airport'


describe Airport do
	it {is_expected.to respond_to(:allow_landing).with(1).argument }
	it {is_expected.to respond_to(:confirm_landing).with(1).argument }
	it {is_expected.to respond_to(:allow_takeoff).with(1).argument }
  
	describe "#land_at_airport" do 
	  it "instructs plane to land at airport" do
	    plane = double("plane")
	    expect(subject.allow_landing(plane)).to eq plane
	  end

    it "confirms that plane has landed" do
	    plane = Plane.new
	    subject.confirm_landing(plane)
	    expect(plane).to have_landed	
	  end
	end

	describe "#takeoff_from_airport" do   
	  it "instructs plane to take off from airport" do
      plane = double("plane")
      expect(subject.allow_takeoff(plane)).to eq plane
	  end
	end

end