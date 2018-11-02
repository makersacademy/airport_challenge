require 'airport'

describe Airport do
 it { is_expected.to respond_to :plane}
end

describe Airport do
  it {is_expected.to respond_to :land_plane}
end
