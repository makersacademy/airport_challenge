require 'plane'
#require 'airport'

describe Plane do

  # 1. #landed?
  it { is_expected.to respond_to(:landed?) }

  # 2. #land
  it { is_expected.to respond_to(:land) }

end
