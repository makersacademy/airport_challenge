require_relative '../lib/plane.rb'


describe Plane do
  plane = Plane.new
  it { is_expected.to respond_to(:takeoff?) }

  it { is_expected.to respond_to(:land?) }
end
