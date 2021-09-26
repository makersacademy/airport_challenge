require "airport"

describe AirPort do
  port = AirPort.new
  plane = AirPlane.new
  
  it "Check if airport exist" do
    expect(port).to exist
  end 
 
  it "Airport has a default capacity" do
    expect(subject.capacity).to eq(AirPort::DEFAULT_CAPACITY)
  end
  
  it 'Abort landing if maximum capacity or bad weather.' do
    described_class::DEFAULT_CAPACITY.times do
      port.land(plane)
    end
    expect(port.land(plane)).to eq("Abort landing!")
  end
  
end 
