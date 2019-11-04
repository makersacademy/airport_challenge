require './lib/plane.rb'

describe Plane do
  it { is_expected.to be_instance_of(Plane) }

  it { is_expected.to respond_to(:at_airport) }
end
