require 'airport'
require 'plane'

describe Airport do
  let(:plane) { Plane.new }

  describe "#land" do
    it "should land a plane at an airport" do
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe "#take_off" do
    it "should let a plane take off from an airport" do
      subject.land(plane)
      expect(subject.take_off).to eq "The plane #{plane} has left the airport"
    end
  end
end
