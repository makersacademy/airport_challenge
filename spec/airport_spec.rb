require 'airport'


describe Airport do
	it {is_expected.to respond_to(:land_at_airport).with(1).argument }
	it {is_expected.to respond_to(:confirm_landing).with(1).argument }
	it {is_expected.to respond_to(:takeoff_from_airport).with(1).argument }
  
	describe "#land_at_airport" do 
	  it "instructs plane to land at airport" do
	    plane = double("plane")
	    expect(subject.land_at_airport(plane)).to eq plane
	  end

    it "confirms that plane has landed" do
	    plane = Plane.new
	    subject.land_at_airport(plane)
	    expect(plane).to have_landed	
	  end
	end

	describe "#takeoff_from_airport" do   
	  it "instructs plane to take off from airport" do
      plane = double("plane")
      expect(subject.takeoff_from_airport(plane)).to eq plane
	  end
	end

end