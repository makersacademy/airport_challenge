require 'plane.rb'

describe Plane do
  it { is_expected.to be_an_instance_of(Plane) }
  it { is_expected.to respond_to(:landed?) }
end
