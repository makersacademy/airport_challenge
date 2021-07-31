require './lib/plane'

describe Plane do

  it { is_expected.to be_instance_of(Plane) }

  it { is_expected.to respond_to(:take_off) }

end
