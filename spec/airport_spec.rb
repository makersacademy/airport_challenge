require 'airport'
require 'plane'

describe Airport do
  describe '.land' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end
  end
  describe '.take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it 'confirms plane is not at airport' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq(false)
    end
  end
end
