require 'airport'

describe Airport do
  it { is_expected.to respond_to(:planes) }

  describe "#capacity" do
    it "should have default capacity of 50" do
      expect(subject.capacity).to eq 50
    end

    it "should have an option to change capacity" do
      ap = Airport.new(100)
      expect(ap.capacity).to eq 100
    end
    
  end

  it "is expected to be able to return a list of planes" do
    expect(subject.planes).to be_instance_of Array
  end

  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:land).with(1).argument }
  
  describe "#land" do
    let(:plane) {double :plane}

    it "should raise error if airport full" do
      subject.capacity.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error "Airport Full"
    end
  

    it "the airport should hold the plane it lands" do
      subject.land(plane)
      expect(subject.planes.first).to eq plane
    end
  end

  describe "#take_off" do
    let(:plane) {double :plane}
    it "should raise error if no planes there" do
      expect {subject.take_off}.to raise_error "No Planes"
    end
    
    it "should remove plane from planes and confirm not in airport" do
      subject.land(plane)
      expect(subject.take_off).to eq plane
      expect(subject.planes).to eq []
    end
  end

end