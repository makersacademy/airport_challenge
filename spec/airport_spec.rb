require 'airport'

describe Airport do
    
  it "can show if it's full" do
    expect(subject).to respond_to :is_full?      
  end
    
  it { is_expected.to respond_to(:land).with(1).argument }
  
  it { is_expected.to respond_to(:take_off).with(1).argument }
  
  it { is_expected.to respond_to(:plane) }
  
  describe "#take_off" do
    
    it "lets plane take off" do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq plane
    end
    
  end
  
  describe "#plane" do
    
    it "shows planes in airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq plane
    end
    
  end
    
  describe "#land" do
    
    it "lets plane land" do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
    
  end
  
end