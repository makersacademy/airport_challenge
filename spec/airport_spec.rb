require 'airport'

describe Airport do
  it { is_expected.to respond_to :instruct_take_off }
  it { is_expected.to respond_to :instruct_landing }
end
