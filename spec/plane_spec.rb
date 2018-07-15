require 'plane'

describe Plane do
  it { is_expected.to respond_to :arrived? }
  it { is_expected.to respond_to :take_off }
end
