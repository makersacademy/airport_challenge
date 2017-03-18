require 'plane'

describe Plane do
  it { is_expected.to respond_to :has_landed? }
  it { is_expected.to respond_to :has_taken_off? }	
end