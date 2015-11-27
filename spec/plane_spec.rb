require 'plane'

describe Plane do
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to(:status) }

end
