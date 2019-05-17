require './lib/airport'
require './lib/plane'

describe Plane do

  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  it { is_expected.to respond_to :working? } # => rspec one-liner syntax

end