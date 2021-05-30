require 'plane'

describe Plane do
   it { is_expected.to respond_to(:report_landed) }
   it { is_expected.to respond_to(:report_take_off) }
end