require 'airport.rb'
require 'plane.rb'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }

  describe '#land' do
    it 'should land the plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  describe '#takeoff' do
    it 'should ensure the plane has taken off' do
      plane = Plane.new
      subject.takeoff(plane)
      expect(subject.planes).to_not include(plane)
    end
  end
end
