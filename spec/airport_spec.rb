require 'Airport'

describe Airport do

  it { is_expected.to respond_to :land_plane }

  it { is_expected.to respond_to :take_off }

end
