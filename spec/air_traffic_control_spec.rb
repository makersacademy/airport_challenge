require 'air_traffic_control'

# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"
# airtraffic control can put a plane in an airport
describe AirTrafficControl do
  it { is_expected.to respond_to :take_off }
  # it knows about planes in the air
  # it 'should be able to take off a plane' do
  #  plane_ground = double('Plane', flying: false)
  # end
end
