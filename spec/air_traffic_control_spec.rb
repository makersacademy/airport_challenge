require 'air_traffic_control'

# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"
# airtraffic control can put a plane in an airport
describe AirTrafficControl do
  it { is_expected.to respond_to :airport }
  it { is_expected.to respond_to :plane }
end
# it should hold one plane
# and one airport
# assuming no errors it can put one plane
# in the airport
# and change that planes status
