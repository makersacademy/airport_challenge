require 'airport'

describe Airport do
    
  it "can show if it's full" do
    expect(subject).to respond_to :is_full?      
  end
    
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  # it { is_expected.to respond_to(:plane) }
  
  it "shows planes in airport" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to eq [plane]
  end
  
  describe "#take_off" do
    
    it "lets plane take off" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
    end
    
  end
    
  describe "#land" do
    
    it "lands planes" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
    
    it "raises error when airport is full" do
      10.times { subject.land(Plane.new) }
      expect { subject.land Plane.new }.to raise_error "Landing not allowed"
    end
    
  end
  
end