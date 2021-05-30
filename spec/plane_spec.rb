require 'plane'

describe Plane do
   it { is_expected.to respond_to(:landed) }
   it { is_expected.to respond_to(:taking_off) }
   it { is_expected.to respond_to(:status) }
end