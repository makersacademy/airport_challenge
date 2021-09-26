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
  

  it 'Landing procedure' do
    described_class::DEFAULT_CAPACITY.times do
      plane = AirPlane.new
      port.land(plane)
    end
    expect(port.land(plane)).to eq("Abort landing!").or eq(port.instance_variable_get(:@port))
  end
  
  it 'Abort take off if bad weather' do
    allow(port).to receive(:weather?).and_return(true)
    expect(port.take_off).to eq("Abort - bad weather!")
  end
  
  
  
end 
