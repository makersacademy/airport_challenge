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
  it 'land calls the land method on a plane' do
    plane = double('Plane', land: 'called')
    subject.plane = plane
    expect(subject.land).to eq 'called'
  end
  it 'can only land a plane if the plane is in the air' do
    plane = double('Plane', flying: false, land: 'cannot land')
    subject.plane = plane
    expect { subject.land }.to raise_error 'cannot land'
  end
  xit 'can only land a plane if there is space at the airport' do
  end
  xit 'redirects planes to a new airport if its stormy' do
  end
  context 'taking off' do
    xit 'has a taking off method' do
    end
    xit 'can call the take off method on a plane' do
    end
    xit 'can call the take off method on an airport' do
    end
    xit 'doesnt let a plane take off if its stormy' do
    end
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
