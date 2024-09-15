require 'plane'

describe Plane do
  it { is_expected.to respond_to :landed? }
  # the plane class is expected to tell us if it has landed
  it { is_expected.to respond_to :flying?}
end
