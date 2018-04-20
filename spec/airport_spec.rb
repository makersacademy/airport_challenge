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
    it { is_expected.to respond_to(:land).with(2).argument }

    it 'is expected to land planes' do
      subject.land(plane, calm_weather)
      expect(subject.planes).to eq [plane]
    end

    it 'is expected not to land planes in stormy weather', :storm_land do
      expect { subject.land(plane, stormy_weather) }.to raise_error "It's too stormy!"
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(2).argument }

    it 'is expected to take off a plane' do
      subject.land(plane, calm_weather)
      expect(subject.take_off(plane, calm_weather)).to eq plane
    end

    it 'is expected to no longer contain plane after take off' do
      subject.land(plane, calm_weather)
      expect(subject.planes).to eq [plane]
      subject.take_off(plane, calm_weather)
      expect(subject.planes).to eq []
    end

    it 'is expected to still contain one plane after another takes off' do
      plane1 = double(:plane)
      plane2 = double(:plane)
      subject.land(plane1, calm_weather)
      subject.land(plane2, calm_weather)
      subject.take_off(plane1, calm_weather)
      expect(subject.planes).to eq [plane2]
    end

    it 'is expected not to take off planes in stormy weather', :storm_take_off do
      subject.land(plane, calm_weather)
      expect { subject.take_off(plane, stormy_weather) }.to raise_error "It's too stormy!"
    end
  end
end
