require 'air_traffic_control'
describe AirTrafficControl do
  it { is_expected.to respond_to :land_plane }
  it 'land_plane calls the land_plane method on an airport' do
    airport = double('Airport', land_plane: 'called')
    subject.airport = airport
    expect(subject.land_plane).to eq 'called'
  end
  it 'can hold a plane' do
    subject.plane = :plane
    expect(subject.plane).to eq :plane
  end
end

# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"
# airtraffic control can put a plane in an airport
#
# it 'should be able to take a plane and land it in an airport'
#  it { is_expected.to respond_to :land_plane }
#  it 'calls the land_plane method on an airport' do
#    airport = double('Airport', )
#  end
# end
# it should hold one plane
# and one airport
# assuming no errors it can put one plane
# in the airport
# and change that planes status
