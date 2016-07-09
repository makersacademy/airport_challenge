require 'airport'

describe Airport do
  it { is_expected.to respond_to(:instruct_land).with(1).argument }

end
