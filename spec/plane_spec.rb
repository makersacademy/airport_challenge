require_relative "../lib/plane"

describe Plane do
  it { is_expected.to respond_to :ready_to_land? }
end
