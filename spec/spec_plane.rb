require 'plane.rb'

describe Plane do
  it { is_expected.to be_instance_of Plane } 
  it { is_expected.to respond_to(:flying?) } 
  it { is_expected.to respond_to(:landing) } 
  it { is_expected.to respond_to(:offtake) } 
end
