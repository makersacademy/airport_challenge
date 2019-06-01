require 'airport'
require 'plane'

describe Airport do
  describe '.land' do
    it 'lands a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end
  describe '.take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it 'confirms plane is no longer at airport' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq([])
    end
  end
end
