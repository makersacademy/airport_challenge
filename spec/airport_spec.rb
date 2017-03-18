require 'airport'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands the plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end

  describe 'plane' do
    it { is_expected.to respond_to(:plane) }
  end

end
