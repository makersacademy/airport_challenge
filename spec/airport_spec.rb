require 'airport'

describe Airport do
  it { is_expected.to respond_to(:request_landing).with(1).arguments }
  it { is_expected.to respond_to(:request_take_off).with(1).arguments }
end
