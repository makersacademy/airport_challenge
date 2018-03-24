require 'plane'

describe Plane do
  subject(:plane) { Plane.new }
  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
  end
end
