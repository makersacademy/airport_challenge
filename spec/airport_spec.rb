require 'airport'

describe Airport do

  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:dock_plane).with(1).argument }

end
