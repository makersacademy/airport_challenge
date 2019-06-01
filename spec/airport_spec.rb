require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  describe '.land' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end
  end
end
