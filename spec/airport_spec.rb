require 'airport'

describe Airport do
  it { is_expected.to respond_to(:instruct_to_land).with(1).argument }
  it { is_expected.to respond_to(:instruct_to_take_off).with(2).argument }
end
