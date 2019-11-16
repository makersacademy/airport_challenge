require 'plane'

describe Plane do

  describe "#takeoff" do
    it "returns :successful when a plane takes off" do
      expect(subject.takeoff).to eq :successful
    end
  end

  describe "#land" do
    it "returns :successful when a plane lands" do
      expect(subject.land).to eq :successful
    end
  end
end
