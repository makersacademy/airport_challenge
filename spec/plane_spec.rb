require 'plane'

describe Plane do
  it { is_expected.to respond_to(:airborne) }
  it { is_expected.to respond_to(:airborne=) }
end
