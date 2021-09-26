require "airport"

describe AirPort do
  port = AirPort.new
  it "Check if airport exist" do
    expect(port).to exist
  end 
  
 # it "Land plane" do
 #   expect(port.land).to eq()
 # end
  describe "#capacity" do
    it "Airport has a default capacity" do
      expect(subject.capacity).to eq(AirPort::DEFAULT_CAPACITY)
    end
  end
  
  subject { AirPort.new }
  let(:plane) { AirPlane.new }
  it 'Maximum capacity test' do
    described_class::DEFAULT_CAPACITY.times do
      subject.land(plane)
    end
    expect{ subject.land(plane) }.to raise_error 'Airport is full'
  end
  
end 
