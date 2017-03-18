require 'airport'

describe Airport do
# 1. #land - airport.land(plane)
it { is_expected.to respond_to(:land).with(1).argument }

# 2. #takeoff - airport.takeoff(plane)
it { is_expected.to respond_to(:takeoff) }


end
