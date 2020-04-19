require 'airport'

describe Airport do
    
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  
  it "shows planes in airport" do
    allow(subject).to receive(:is_stormy?) {false}
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to eq [plane]
  end
  
  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  
  describe "#take_off" do
    
    it "lets plane take off" do
    allow(subject).to receive(:is_stormy?) {false}
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
    end
    
    it "raises error when the weather is stormy" do
      allow(subject.weather).to receive(:is_stormy?) { true }
      expect { subject.take_off Plane.new }.to raise_error "Taking off not allowed in stormy weather"
    end
    
  end
    
  describe "#land" do
    
    it "lands planes" do
      allow(subject).to receive(:is_stormy?) {false}
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
    
    it "raises error when airport is full" do
      allow(subject).to receive(:is_stormy?) {false}
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land Plane.new }.to raise_error "Landing not allowed, airport full"
    end
    
    it "raises error when the weather is stormy" do
      allow(subject.weather).to receive(:is_stormy?) { true }
      expect { subject.land Plane.new }.to raise_error "Landing not allowed in stormy weather"
    end
    
  end
  
end