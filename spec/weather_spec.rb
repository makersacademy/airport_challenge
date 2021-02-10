describe Weather do
  it { is_expected.to respond_to(:forcast).with 0 }
  let(:airport) { instance_double(Airport, 'Airport', weather_forcast: subject.forcast) }

  describe '#forcast' do
    context 'when high pressure' do
      it 'is sunny' do
        allow(subject).to receive(:atmospheric_pressure) { 90 }
        expect(subject.forcast).to be :sunny
      end
    end

    context 'when moderate pressure' do
      it 'is sunny' do
        allow(subject).to receive(:atmospheric_pressure) { 55 }
        expect(subject.forcast).to be :sunny
      end
    end

    context 'when very low pressure' do
      it 'is stormy' do
        allow(subject).to receive(:atmospheric_pressure) { 8 }
        expect(subject.forcast).to be :stormy
      end
    end

    context 'when called in airport' do
      it 'returns the sunny forcast correctly' do
        allow(subject).to receive(:atmospheric_pressure) { 90 }
        expect(airport.weather_forcast).to be :sunny
      end
    end

    context 'when called in airport' do
      it 'returns the stormy forcast correctly' do
        allow(subject).to receive(:atmospheric_pressure) { 2 }
        expect(airport.weather_forcast).to be :stormy
      end
    end
  end
end
