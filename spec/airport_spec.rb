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

  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }

    it 'is expected to takeoff a plane' do
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

    it 'is expected to no longer contain plane after takeoff' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
      subject.takeoff(plane)
      expect(subject.planes).to eq []
    end
  end
end
