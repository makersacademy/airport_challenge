require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to :instruct_landing }
  it { is_expected.to respond_to :instuct_take_off }

  describe "#instruct_landing" do
    it "can instruct a plane to land" do
      plane = "plane"
      expect(subject.instruct_landing(plane)).to eq("#{plane} landed safely")
    end
  end

  describe "#instruct_take_off" do
    it "can instruct a plane to take_off" do
      plane = "plane"
      expect(subject.instuct_take_off(plane)).to eq("#{plane} has taken-off safely")
    end
  end
end
