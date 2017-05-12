require 'airport'

describe Airport do

  it { is_expected.to respond_to(:lands_plane).with(1).argument }

end
