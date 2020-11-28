require 'plane'

describe Plane do
  describe "#land" do
    it "lands at an airport" do
      expect(subject.land).to eq "Landed!"
    end
  end

  describe "#take_off" do
    it "takes off and confirms" do
      expect (subject.take_off).to eq "Taken off!"
    end
  end
end
