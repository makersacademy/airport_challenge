require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {Airport.new}

  it { is_expected.to respond_to :plane_takeoff }



end
