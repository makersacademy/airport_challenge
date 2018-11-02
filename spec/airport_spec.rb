require 'airport'
require 'plane'

describe Airport do
  it 'should land a plane' do
    airbus = Plane.new
    expect(subject.land(airbus)).to eq airbus
  end
  describe '#takeoff' do
    it 'should remove a plane from the airport' do
      airbus = Plane.new
      expect(subject.takeoff(airbus)).to eq "#{airbus} has taken off"
    end
  end
end
