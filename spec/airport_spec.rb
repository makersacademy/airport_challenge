require 'airport'
require "plane"
require 'weather'

describe Airport do
  let(:plane) {double Plane.new}
  let (:today) {double Weather.new}

  describe "#land" do
    it "should land planes into airport" do
      expect(subject.land(plane, "sunny")).to eq "#{plane} landed"
    end

    it "should not allow planes to land when weather is stormy" do
      expect(subject.land(plane, "stormy")).to eq "Plane not able to land due to storm"
    end
  end

  describe "#take_off" do
    it "should make planes take off" do
      expect(subject.take_off(plane)).to eq ("#{plane} has taken off")
    end
  end

end
