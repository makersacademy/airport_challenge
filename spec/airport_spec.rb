require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }
end

describe Airport do
  it { is_expected.to respond_to :take_off }
end
