require 'airport'


describe Airport do
	it {is_expected.to respond_to(:land).with(1).argument }
	it {is_expected.to respond_to(:confirm_landing).with(1).argument }
	# it {is_expected.to respond_to(:dock).with(1).argument }
	it {is_expected.to respond_to(:takeoff).with(1).argument }
  
	describe "#instruct" do
    it "gives instructions to a plane" do
      plane = double("plane")
      expect(subject.instruct(plane)).to eq [plane]
    end
	end


	describe "#allow_landing" do 
	  it "instructs plane to land at airport" do
	    plane = double("plane")
	    subject.instruct(plane)
	    expect(subject.land(plane)).to eq [plane]
	  end

    it "confirms that plane has landed" do
    	plane = double("plane")
	    landed_plane = subject.land(plane)
	    expect(subject.confirm_landing(landed_plane)).to eq landed_plane	
	  end
	end

	describe "#allow_takeoff" do   
	  it "instructs a docked plane to take off from airport" do
    	plane = double("plane")
    	subject.instruct(plane)
    	subject.confirm_landing(plane)
      expect(subject.takeoff(plane)).to eq plane
	  end
	  
	  it "confirms that the plane has left the airport" do 
      plane = double("plane", :has_taken_off? => true)
      expect(plane).to have_taken_off 
	  end

	  it "raises error when plane has left airport" do
	    landed_plane = double("landed_plane")
	    expect {subject.takeoff(landed_plane)}.to raise_error "the plane has already departed"
	  end    	

	end

	describe "#weather_report" do
    it "creates a weather report" do
    	weather = double("weather")
    	allow(weather).to receive(:weather)
      expect(subject.weather_report).to eq "stormy"
    end

	end

end