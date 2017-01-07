require "air_traffic_control"
describe AirTrafficControl do
  let(:airport) {double :airport,plane_landed: true,plane_taken_off: true}
  let(:plane)   {double :plane,take_off: true, land: true}
  let(:plane_false)  {double :plane_false}

  #allow(plane_false).to receive(:land).and_raise("error")

  describe "#land_plane" do
    it{expect{subject.land_plane plane,airport}.not_to raise_error}
    it "raises errors properly" do
      allow(plane).to receive(:land).and_raise("error")
      expect{subject.land_plane plane, airport}.to raise_error("error")
    end
  end

  describe "#take_off_plane" do
    it{expect{subject.take_off_plane plane,airport}.not_to raise_error}
    it "raises errors properly" do
      allow(plane).to receive(:take_off).and_raise("error")
      expect{subject.take_off_plane plane, airport}.to raise_error("error")
    end
  end
  it {is_expected.to respond_to(:take_off_plane).with(2).arguments}
end
