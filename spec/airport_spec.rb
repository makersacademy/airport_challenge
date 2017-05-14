require 'airport'

describe Airport do
  it { is_expected.to respond_to(:planes_on_ground) }
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:takeoff_plane).with(2).argument }

end