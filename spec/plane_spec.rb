require 'plane'

describe Plane do
  it { is_expected.to respond_to(:flying?, :land, :take_off, :current_airport) }
end