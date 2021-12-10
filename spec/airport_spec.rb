require 'airport'

describe Airport do

  # Test - get plane to land at airport
  it { is_expected.to respond_to :land_plane }
end