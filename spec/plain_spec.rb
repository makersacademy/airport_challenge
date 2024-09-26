require "./lib/plane"

describe Plane do

  it { is_expected.to respond_to(:boarding).with(1).argument }
  
end
