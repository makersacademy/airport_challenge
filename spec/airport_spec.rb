require 'airport'
require 'plane'
require 'weather'

describe Airport do

  describe '#land(plane)' do

    it 'recieves a plane when one lands' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#takeoff(plane)' do

    it 'confirms the plane has taken off and is not in the airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

    it 'does not allow a plane to take off if it\'s stormy' do
      plane = Plane.new
      expect {subject.takeoff(plane)}.to raise_error 'It is too stormy to take off'
    end
  end
end
