require 'airport'
require 'plane'

describe Airport do
    it { is_expected.to respond_to :land_plane }
    end
end