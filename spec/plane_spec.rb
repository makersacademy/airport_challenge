require 'plane'

describe Plane do

  it { is_expected.to respond_to :on_ground }

  it { is_expected.to have_attributes(:on_ground => true) }

end
