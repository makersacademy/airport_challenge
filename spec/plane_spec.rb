require 'plane'
require 'weather'

describe Plane do

  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :depart }

end
