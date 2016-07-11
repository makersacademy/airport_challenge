require 'airport'

describe Airport do
  it { is_expected.to respond_to(:instruct_landing).with(1).arguments }
  it { is_expected.to respond_to(:instruct_takeoff).with(1).arguments }
end
