require 'airport'
require 'plane'

describe Airport do
  describe '#land' do
    it 'instruct a plane to land' do
      plane = Plane.new
      subject.land
      expect(subject).to respond_to(:land)
    end
  end

  describe '#take_off' do
    it 'instruct a plane to take off' do
      plane = Plane.new
      subject.take_off
      expect(subject).to respond_to(:take_off)
    end
  end
end
