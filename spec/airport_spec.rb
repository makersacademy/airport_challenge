require 'airport'

describe Airport do
  let(:plane) { instance_double Plane }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'is expected to land planes' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  describe '#planes' do
    it { is_expected.to respond_to(:planes) }

    it 'is expected to initialize with no planes' do
      expect(subject.planes).to eq []
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'is expected to make a plane take off' do
      expect(subject.take_off(plane)).to eq plane
    end

    it 'Airport is expected to not contain after take_off' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
      subject.take_off(plane)
      expect(subject.planes). to eq []
    end
  end
end
