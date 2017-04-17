require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  context "#land" do
    it "Expects a plane to respond to #land with an argument" do
      expect(plane).to respond_to(:land).with(1).argument
    end
    it { is_expected.to respond_to :landed }
  end
end
