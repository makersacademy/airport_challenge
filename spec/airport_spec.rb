require 'airport'


describe Airport do
	it {is_expected.to respond_to(:land).with(1).argument }
	it {is_expected.to respond_to(:confirm_landing).with(1).argument }
	it {is_expected.to respond_to(:takeoff).with(1).argument }

	describe "#land" do 
	  it "instructs plane to land at airport" do
	    plane = double("plane")
	    expect(subject.land(plane)).to eq [plane]
	  end

    it "confirms that plane has landed" do
    	plane = double("plane")
	    landed_plane = subject.land(plane)
	    expect(subject.confirm_landing(landed_plane)).to eq landed_plane	
	  end

    it "raises an error when airport is at full capacity" do
      airport = Airport.new(2)
      plane = double("plane")
      2.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Landing denied, Airport is full"
    end

    it "prevents landing if weather is stormy" do
    	plane = double("plane")
      subject.land(plane)
      expect {subject.weather_report}.to raise_error "Landing denied, weather report stormy"
    end
	end

	describe "#takeoff" do   
	  it "instructs a plane to take off from airport" do
    	plane = double("plane")
    	subject.land(plane)
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

	  it "prevents takeoff if weather is stormy" do
    	plane = double("plane")
      subject.land(plane)
      subject.confirm_landing(plane)
      expect {subject.weather_report}.to raise_error "Take off denied, weather report stormy"
    end   	
	end

	describe "#weather_report" do
    it "creates a weather report" do
    	weather = double("weather")
    	allow(weather).to receive(:roll)
    	weather.roll
    end
	end

end