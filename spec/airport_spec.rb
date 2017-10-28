require 'airport'
require "plane"

describe Airport do
  let(:plane) {double Plane.new}

  describe "#land" do
    it "should land planes into airport" do
      expect(subject.land(plane)).to eq ("#{plane} landed")
    end
  end

  describe "#take_off" do
    it "should make planes take off" do
      expect(subject.take_off(plane)).to eq ("#{plane} has taken off")
    end
  end

end
