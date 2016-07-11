require 'plane'

describe Plane do
  it { is_expected.to respond_to :lands }
  it { is_expected.to respond_to :landed? }
end
