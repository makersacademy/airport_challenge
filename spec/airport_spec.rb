require 'airport'

describe Airport do
  let(:plane) { instance_double Plane }
  let(:stormy_weather) { instance_double Weather, stormy?: true }
  let(:calm_weather) { instance_double Weather, stormy?: false }

  describe '#planes' do
    it { is_expected.to respond_to(:planes) }

    it 'is expected to initialize with no planes' do
      expect(subject.planes).to eq []
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'is expected to land planes' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'is expected to take off a plane' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'is expected to no longer contain plane after take off' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

    it 'is expected to still contain one plane after another takes off' do
      plane1 = double(:plane)
      plane2 = double(:plane)
      subject.land(plane1)
      subject.land(plane2)
      subject.take_off(plane1)
      expect(subject.planes).to eq [plane2]
    end

    it 'is expected not to land planes in stormy weather' do

    end
  end
end
