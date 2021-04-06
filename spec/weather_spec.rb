require 'weather'

describe Weather do
  it { is_expected.to respond_to(:forecast).with 0 }
  
  describe '#forcast' do
      context 'when high pressure' do
        it 'is standard weather' do
          allow(subject).to receive(:atm_pressure) { 970 }
          expect(subject.forecast).to be :standard
        end
      end

    context 'when moderate pressure' do
      it 'is standard weather' do
        allow(subject).to receive(:atm_pressure) { 950 }
        expect(subject.forecast).to be :standard
      end
    end

    context 'when low pressure' do
      it 'is stormy weather' do
        allow(subject).to receive(:atm_pressure) { 910 }
        expect(subject.forecast).to be :stormy
      end
    end
  end

  describe '#atm_pressure' do
    it 'covers a range from (900..1000)' do
      expect(900..1000).to cover(subject.send :atm_pressure)
    end
  end

end
