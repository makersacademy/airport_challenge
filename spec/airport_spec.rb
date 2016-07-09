require 'airport'

describe Airport do
  it { is_expected.to respond_to(:request_landing).with(1).arguments }
end
