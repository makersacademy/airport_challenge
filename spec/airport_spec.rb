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
  
  it 'Test airport maximum capacity' do
    described_class::DEFAULT_CAPACITY.times do
      plane = AirPlane.new
      allow(port).to receive(:weather?).and_return(false)
      port.land(plane)
    end
    expect(port.land(plane)).to eq("Abort landing!")
  end
  
  it 'Check weather when landing' do
    allow(port).to receive(:weather?).and_return(true)
    expect(port.land(plane)).to eq("Abort landing!")
  end
  
  it 'Abort take off if bad weather' do
    allow(port).to receive(:weather?).and_return(true)
    expect(port.take_off).to eq("Abort - bad weather!")
  end
  
  it 'Take off successfull' do
    allow(port).to receive(:weather?).and_return(false)
    expect(port.take_off).to eq("Air plane successfully depart")
  end
  
  it 'Check port for any planes before calling take off procedure' do
    port.instance_variable_set(:@port, []) 
    allow(port).to receive(:weather?).and_return(false)
    expect(port.take_off).to eq("Abort - no planes to take off")
  end
  
  it 'Test Airport (capacity incresed to 50) - incoming 100 planes + departure of 50 planes' do
    port.instance_variable_set(:@capacity, 50) 
    100.times do
      plane = AirPlane.new
      port.land(plane)
      expect(port.land(plane)).to eq("Abort landing!").or eq(port.instance_variable_get(:@port))
    end
    port.instance_variable_get(:@capacity).times do
      expect(port.take_off).to eq("Abort - bad weather!").or eq("Air plane successfully depart").or eq("Abort - no planes to take off")
    end
  end
  
end 
