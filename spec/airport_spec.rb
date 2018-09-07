require 'airport'
require 'plane'

describe Airport do
  describe '#land' do
    it 'instruct a plane to land' do
      plane = Plane.new
      subject.land(plane)
      expect(subject).to respond_to(:land).with(1).argument

    end
  end

  describe '#take_off' do
    it 'instruct a plane to take off' do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end
end
