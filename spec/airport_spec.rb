require 'airport'

describe Airport do
  it { is_expected.to respond_to :land_a_plane }

  it { is_expected.to respond_to :take_off_plane }
end
