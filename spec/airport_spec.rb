#As an air traffic controller
#So I can get passengers to a destination
# want to instruct a plane to land at an airport

require 'airport'

describe AirportController do
    it { is_expected.to respond_to(:land) }
  end
