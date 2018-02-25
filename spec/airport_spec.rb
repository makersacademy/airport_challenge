require "class_airport"
plane = Plane.new
airport = AirPort.new

describe "#land(plane)" do
  it "lets plane land" do
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error
    expect { airport.land(plane).count } == 1
  end

  it "raises an error when stormy" do
    allow(airport).to receive(:stormy?).and_return true
    message = "It's stormy! You can't land."
    expect { airport.land(plane) }.to raise_error message
  end

  it "raises an error when full" do 
    allow(airport).to receive(:stormy?).and_return false
    airport.land(plane)
    message = "The airport is full!"
    expect { 
      loop do airport.land(plane) end
    }.to raise_error message  
  end
      
  it "has the plane after landing" do
    airport = AirPort.new
    allow(airport).to receive(:stormy?).and_return false
    expect(airport.land(plane)).to include plane
  end   
end  
    

describe "#takeoff(plane)" do    
  it "raises an error with storm" do
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
    allow(airport).to receive(:stormy?).and_return false
    airport.land(plane)
    expect(airport.takeoff(plane)).to eq plane
  end
end
