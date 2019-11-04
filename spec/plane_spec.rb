require 'plane'

describe Plane do
# I want to instruct a plane to land at an airport
  it { is_expected.to respond_to :land_plane }
end
