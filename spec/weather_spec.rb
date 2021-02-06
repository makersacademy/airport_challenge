describe Weather do
  it { is_expected.to respond_to(:forcast).with 0 }

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

    context 'when low pressure' do
      it 'is sunny' do
        allow(subject).to receive(:atmospheric_pressure) { 20 }
        expect(subject.forcast).to be :sunny
      end
    end

    context 'when very low pressure' do
      it 'is stormy' do
        allow(subject).to receive(:atmospheric_pressure) { 8 }
        expect(subject.forcast).to be :stormy
      end
    end
  end
end
