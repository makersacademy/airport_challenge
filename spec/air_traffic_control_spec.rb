require 'air_traffic_control'
describe AirTrafficControl do
  it { is_expected.to respond_to :land_plane }
  it 'land_plane calls the land_plane method on an airport' do
    airport = double('Airport',
                     num_planes: 10,
                     capcity: 20,
                     land_plane: 'called')
    subject.airport = airport
    expect(subject.land_plane).to eq 'called'
  end
  it 'can hold a plane' do
    subject.plane = :plane
    expect(subject.plane).to eq :plane
  end
  it 'land calls the land method on a plane' do
    plane = double('Plane', flying: true, land: 'called')
    subject.plane = plane
    expect(subject.land).to eq 'called'
  end
  it 'can only land a plane if the plane is in the air' do
    plane = double('Plane', flying: false, land: 'cannot land')
    subject.plane = plane
    expect { subject.land }.to raise_error 'cannot land'
  end
  it 'can only land a plane if there is space at the airport' do
    airport = double('Airport',
                     num_planes: 20,
                     capcity: 20,
                     land_plane: 'called')
    subject.airport = airport
    expect { subject.land_plane }.to raise_error 'airport at capcity'
  end
  context 'weather' do
    it { is_expected.to respond_to :weather }
    it 'knows the airports weather' do
      airport = double('Airport', weather: false)
      subject.airport = airport
      expect(subject.weather).to eq false
    end
    it { is_expected.to respond_to :wait_for_sun }
    # how do I test a method that calls a new instance
    # of a class inside a method?
    xit 'wait for sun accepts an instance of weather' do
      expect(subject.wait_for_sun :weather).to eq :weather
    end
    xit 'wait for sun changes weather' do
      airport = double('Airport', weather: false)
      subject.airport = airport
      weather = double('Weather', weather: true)
      subject.wait_for_sun weather
      expect(subject.weather).to eq true
    end
    # if weather method returns false
    # call the wait for sun method
    # until weather returns true
    xit 'it can change the airports weather if stormy' do
      # which would be call a new instance of weather
      # and pass that to the airport
    end
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
