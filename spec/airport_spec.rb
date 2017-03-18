require 'airport'

describe Airport do
# 1. #land - plane.land(airport)
it { is_expected.to respond_to(:land).with(1).argument }

end
