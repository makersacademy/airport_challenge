require 'airport'
require 'plane'

describe Airport do
  it 'lands planes' do
    subject {is_expected.to respond_to(:land).with(1).argument}
  end
  it 'allows planes to takeoff' do
    subject {is_expected.to respond_to(:takeoff)}
  end


  describe '#land' do
    it 'Confirms which planes are in the airport' do
      plane = Plane.new
      expect {subject.land(plane).to eq plane}
    end
  end
#???? Not sure of the take test
  describe '#takeoff' do
    it 'Confirms plane is no longer in the airport' do
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect {subject.planes.to_not include plane }
    end
  end
end
