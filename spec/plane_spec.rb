require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }
end
