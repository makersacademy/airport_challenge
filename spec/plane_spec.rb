require 'plane'

describe Plane do
  # responds to basic methods
  subject(:plane) { described_class.new }
  it { is_expected.to respond_to :arrived? }
end
