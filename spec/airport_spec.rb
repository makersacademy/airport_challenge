require 'airport'
require 'plane'

describe Airport do
  describe '#land' do
    it 'should land a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  describe '#take_off' do
    it 'should make a plane take off' do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end
end