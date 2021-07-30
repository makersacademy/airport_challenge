require 'plane'

describe Plane do
  
  it { is_expected.to be_a Plane }

  it { is_expected.to respond_to(:land).with(1).argument }

end
