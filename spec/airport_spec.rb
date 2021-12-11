require 'airport'
require 'plane'

describe Airport do
  describe "#instruct_landing" do
    it "can instruct a plane to land" do
      plane = "plane"
      expect(subject.instruct_landing(plane)).to eq("#{plane} landed safely")
    end
  end
end
