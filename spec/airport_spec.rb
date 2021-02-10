describe Airport do
  let(:plane) { instance_double(Plane, 'Plane') }
  let(:weather) { instance_double(Weather, 'Weather', forcast: :sunny)}
  subject { described_class.new(weather: weather) }

  it { is_expected.to respond_to(:capacity).with 0 }
  it { is_expected.to respond_to(:weather_forcast).with 0 }
  it { is_expected.to respond_to(:contain?).with 1 }

  describe '#contain?' do
    context 'when plane is not in airport' do
      it 'returns false' do
        expect(subject).not_to be_contain plane
      end
    end

    context 'when plane is in aiport' do
      it 'returns true' do
        subject.request_landing(plane)
        expect(subject).to be_contain plane
      end
    end
  end

  describe '#capacity' do
    context 'when initialized without argument' do
      subject { described_class.new.capacity }
      it { is_expected.to be described_class::DEFAULT_CAPACITY }
    end

    context 'when intialized with argument 100' do
      subject { described_class.new(capacity: 100, weather: weather).capacity }
      it { is_expected.to be 100 }
    end

    context 'after intialization' do
      it 'can still be overridden' do
        subject.capacity = 500
        expect(subject.capacity).to be 500
      end
    end
  end

  describe '#weather_forcast' do
    it 'returns the forcast' do
      expect(subject.weather_forcast).to be :sunny
    end
  end
end
