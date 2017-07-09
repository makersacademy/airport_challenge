require "plane"

describe Plane do
  it { is_expected.to respond_to(:landed).with(1).arguments }
end
