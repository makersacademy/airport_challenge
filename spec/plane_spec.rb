require 'airport'
require 'plane'

describe Plane do
  before(:each) { Plane.new }

  it { is_expected.to respond_to(:in_flight?) }
end