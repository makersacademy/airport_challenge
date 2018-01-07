require 'airport'

describe Airport do
  context "Check airport capacity" do
    it 'sets capacity to default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
  context "Check airport capacity" do
    it 'responds to full?' do
      expect(subject).to respond_to :full?
    end
    it "should be not full by default" do
      expect(subject).not_to be_full
    end
    it "should be empty by default" do
      expect(subject).to be_empty
    end
  end

  context "Landing" do
    it "should be able to land a plane" do
      plane = double("plane", :airborne => true, :airborne= => false)
      subject.land(plane)
      expect(subject.planes_on_the_ground.count).to eq 1
    end
  end

  context "takeoff" do
    it "should be able to make a plane to takeoff" do
      plane = double("plane", :airborne => true, :airborne= => false)
      subject.land(plane)
      expect(subject.planes_on_the_ground.count).to eq 1
      allow(plane).to receive("airborne=").and_return(false)
      subject.takeoff
      expect(subject.planes_on_the_ground.count).to eq 0
    end
  end

end
