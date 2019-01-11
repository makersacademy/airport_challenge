# should airport be responsible for checking that objects trying to land at it are planes or should planes
# be expected to check they are trying to land at airport objects? Probably both?

require 'airport'
describe Airport do
  let(:plane) { double :plane }
  let(:second_plane) { double :second_plane }
  describe "landing and entering system on ground" do
    it "accepts planes landing and stores them" do
      expect(subject.plane_landing(plane).planes).to eq [plane]
    end
    it "should not allow landing when airport is full" do
      subject.capacity.times { subject.plane_landing(plane) }
      expect(subject.can_land?).to eq false
    end
    it "can accept planes being entering system on the ground at airports" do
      expect(subject.plane_entering_on_ground(plane).planes).to eq [plane]
    end
  end

  describe "taking off" do
    it "can be told plane is taking off and remove plane" do
      expect(subject.plane_landing(plane).plane_taking_off(plane).planes).to eq []
      subject.plane_landing(plane).plane_landing(second_plane)
      expect(subject.plane_taking_off(second_plane).planes).to eq [plane]
    end
  end

  describe "storminess" do
    it "stormy should be random and should not allow landing / taking if it is" do
      srand(120_32)
      expect(subject.can_land?).to eq false
      srand(120_32)
      expect(subject.can_take_off?).to eq false
      srand(10)
      expect(subject.can_land?).to eq true
      srand(10)
      expect(subject.can_take_off?).to eq true
    end
  end

  describe "capacity" do
    it "should have a default capacity but that capacity be changeable" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      expect(Airport.new(1000).capacity).to eq 1000
      expect(subject.change_capacity(33).capacity).to eq 33
    end
  end
end
