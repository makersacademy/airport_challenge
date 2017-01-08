require "air_traffic_control"
describe AirTrafficControl do
  let(:airport) {double :airport,plane_landed: true,plane_taken_off: true}
  let(:plane)   {double :plane,take_off: true, land: true}

  describe "#land_plane" do
    before(:each) do
      allow(airport).to receive(:full?).and_return false
      allow(airport).to receive(:stormy?).and_return false
      allow(plane).to   receive(:landed?).and_return false
    end
    it "should land if all conditions are good" do
      expect(subject.land_plane plane,airport).to eq true
    end
    it "should not land if airport is full" do
      allow(airport).to receive(:full?).and_return true
      expect(subject.land_plane plane,airport).to eq false
    end
    it "should not land if airport is stormy" do
      allow(airport).to receive(:stormy?).and_return true
      expect(subject.land_plane plane,airport).to eq false
    end
    it "should not land if plane is landed" do
      allow(plane).to receive(:landed?).and_return true
      expect(subject.land_plane plane,airport).to eq false
    end
  end

  describe "#take_off_plane" do
    before(:each) do
      allow(airport).to receive(:stormy?).and_return false
      allow(plane).to   receive(:landed?).and_return true
    end
    it "should take_off if all conditions are good" do
      expect(subject.take_off_plane plane,airport).to eq true
    end
    it "should not take_off if airport is stormy" do
      allow(airport).to receive(:stormy?).and_return true
      expect(subject.take_off_plane plane,airport).to eq false
    end
    it "should not take_off if plane is already flying" do
      allow(plane).to receive(:landed?).and_return false
      expect(subject.take_off_plane plane,airport).to eq false
    end
  end

end

  #'describe "#take_off_plane" do
