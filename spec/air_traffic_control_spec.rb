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
  # it 'should be able to take a plane and land it in an airport'
  it { is_expected.to respond_to :land_plane }

  it 'should be able to land a plane' do
    plane = double('Plane', flying: true)
    subject.land_plane plane
    expect(plane.flying).to eq false
  end
end
# it should hold one plane
# and one airport
# assuming no errors it can put one plane
# in the airport
# and change that planes status
