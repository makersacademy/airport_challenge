require './lib/plane'

describe Plane do
  # from boris bikes: it { is_expected.to respond_to(:release_bike) }
  # it responds to land
  it {is_expected.to respond_to :land}
  it {is_expected.to respond_to :landed?}
  it {is_expected.to respond_to :take_off}
  it {is_expected.to respond_to :departed?}





end
