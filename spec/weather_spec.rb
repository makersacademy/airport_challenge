require 'weather'
require 'airport'
require 'plane'

describe Weather do

  it { is_expected.to respond_to :storm? }

end
