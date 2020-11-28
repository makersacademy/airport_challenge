require 'plane'

describe Plane do
  describe "#land" do
    it "lands at an airport" do
      expect(subject.land).to eq "Landed!"
    end
  end
end
