require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to :instruct_landing }
  it { is_expected.to respond_to :instruct_take_off }

  describe "#instruct_landing" do
    it "can instruct a plane to land" do
      plane = Plane.new
      expect(subject.instruct_landing(plane)).to eq("#{plane} landed safely")
    end
  end

  describe "#instruct_take_off" do
    it "can instruct a plane to take_off" do
      plane = Plane.new
      expect(subject.instruct_take_off(plane)).to eq(plane)
    end
  end
end
