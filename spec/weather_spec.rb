describe Weather do
  it { is_expected.to respond_to :forcast }

  describe '#forcast' do
    context 'when low pressure' do
      it 'is sunny' do
        allow(subject).to receive(:atmospheric_pressure) { 2 }
        expect(subject.forcast).to be :sunny
      end
    end

    context 'when high pressure' do
      it 'is sunny' do
        allow(subject).to receive(:atmospheric_pressure) { 9 }
        expect(subject.forcast).to be :sunny
      end
    end

    context 'when very high pressure' do
      it 'is stormy' do
        allow(subject).to receive(:atmospheric_pressure) { 10 }
        expect(subject.forcast).to be :stormy
      end
    end
  end
end
