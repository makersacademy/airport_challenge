require 'airport'

describe Airport do
  it { is_expected.to respond_to(:send_to_hangar).with(1).argument }
end
