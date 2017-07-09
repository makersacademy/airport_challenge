require 'airport'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:plane) }

    it 'lands plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.land(plane)).to eq plane
    end
  end
  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it { is_expected.to respond_to(:plane) }

    it 'plane departs' do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.take_off(plane)).to eq plane
    end
  end
end
