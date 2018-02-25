require "class_airport"
plane = Plane.new
# describe AirPort do
#   subject(:airport) { described_class.new }
#   let(:plane) { double :plane }

  # describe 'a group of tests that need to call #land on a plane double' do
  #   before do
  #     allow(plane).to receive(:land)
  #   end
  # end
  


	describe "#land(plane)" do
	  it "lets plane land" do
	  	airport = AirPort.new
	  	#expect(plane).to receive(:land)
	  	allow(airport).to receive(:stormy?).and_return false
	  	expect { airport.land(plane) }.not_to raise_error
	  	expect { airport.land(plane).count } == 1
	  end

	  it "raises an error when stormy" do
	    airport = AirPort.new #making a new instance to make the airport not full
	  	allow(airport).to receive(:stormy?).and_return true
	  	message = "It's stormy! You can't land."
	  	expect { airport.land(plane) }.to raise_error message
	  end

	  it "raises an error when full" do	
	  	airport = AirPort.new
	  	allow(airport).to receive(:stormy?).and_return false
	  	airport.land(plane)
	  	message = "The airport is full!"
	  	 #times { airport.land(plane) }
	  	expect { 
	  		while true do airport.land(plane) end
	  	}.to raise_error message  
	  end
	  
	  it "has the plane after landing" do
	  	#allow(:plane).to receive(:land)
	  	airport = AirPort.new
	  	allow(airport).to receive(:stormy?).and_return false
	  	plane = Plane.new
	  	#airport.land(plane)
	  	expect(airport.land(plane)).to include plane
	  end  	
	end  
	

	describe "#takeoff(plane)" do    
	  it "raises an error with storm" do
	  	airport = AirPort.new
	  	allow(airport).to receive(:stormy?).and_return false
	  	airport.land(plane)
        allow(airport).to receive(:stormy?).and_return true
	  	message = "It's stormy! You can't take off."
	  	expect { airport.takeoff(plane) }.to raise_error message
	  end  
	  it "raises an error with empty airport" do
	  	airport = AirPort.new
	  	allow(airport).to receive(:stormy?).and_return false
	  	message = "There is no plane to take off!"
	    expect { airport.takeoff(plane) }.to raise_error message
	  end
	  it "lets take plane off" do
	  	airport = AirPort.new
	  	allow(airport).to receive(:stormy?).and_return false
	  	airport.land(plane)
	  	expect(airport.takeoff(plane)).to eq plane
	  end
	end  	

