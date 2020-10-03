require 'plane'

describe Plane do
  describe '#in_air' do
    it { is_expected.to respond_to(:in_air?) }
  end
end
