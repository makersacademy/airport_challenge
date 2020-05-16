require_relative '../lib/plane'

describe Plane do
  let(:plane) { Plane.new }

  it { is_expected.to respond_to :take_off }

end
