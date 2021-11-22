require 'plane'

describe Plane do
  describe "#initialize" do
    let(:subject) { Plane.new }
    it { is_expected.to eq subject }
  end
end
