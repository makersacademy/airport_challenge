require 'airport'
describe Airport do
  # airport can land planes
  it { is_expected.to respond_to :land_plane }
  it { is_expected.to respond_to :plane_take_off }
  it { is_expected.to respond_to(:plane) }
end
