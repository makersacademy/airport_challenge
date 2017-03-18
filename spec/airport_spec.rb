require 'airport'


describe Airport do
	it {is_expected.to respond_to(:allow_landing).with(1).argument }
	it {is_expected.to respond_to(:confirm_landing).with(1).argument }
	it {is_expected.to respond_to(:dock).with(1).argument }
	it {is_expected.to respond_to(:allow_takeoff).with(1).argument }
  
	describe "#allow_landing" do 
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

	describe "#dock" do 
    it "docks plane at airport" do
      plane = Plane.new
      expect(subject.dock(plane)).to eq plane  
    end	

	end

	describe "#allow_takeoff" do   
	  it "instructs plane to take off from airport" do
      plane = double("plane")
      expect(subject.allow_takeoff(plane)).to eq plane
	  end
	  
	  it "confirms that the plane has left the airport" do 
      plane = double("plane", :has_taken_off? => true)
      expect(plane).to have_taken_off 
	  end	

	end

end