require 'plane'

describe Plane do
  subject(:plane) { Plane.new }

  it { is_expected.to respond_to :landed? }

end
