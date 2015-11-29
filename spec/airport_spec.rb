require 'airport'
require 'plane'

describe Airport do

  describe '#land(plane)' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should allow a plane to land' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end

  describe '#takeoff(plane)' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }

    it 'should allow a plane to takeoff' do
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).not_to include plane
    end
  end
end
