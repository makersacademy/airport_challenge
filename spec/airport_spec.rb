require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {Airport.new}

  it { is_expected.to respond_to :plane_takeoff }

  it { is_expected.to respond_to(:land_plane).with(1).argument }




end
