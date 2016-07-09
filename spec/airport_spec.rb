require 'airport'

describe Airport do
  it { is_expected.to respond_to :instruct_plane_to_land }
end
