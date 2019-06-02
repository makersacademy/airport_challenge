#As an air traffic controller
#So I can get passengers to a destination
# want to instruct a plane to land at an airport

require 'airport'

describe AirportController do
    it { is_expected.to respond_to(:land).with(1).argument }

  #  As an air traffic controller
#  So I can get passengers on the way to their destination
#  I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it { is_expected.to respond_to(:take_off).with(1).argument}

end 
