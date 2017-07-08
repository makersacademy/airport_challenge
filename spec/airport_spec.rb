require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:takeoff) }
  it { is_expected.to respond_to(:land) }

end
