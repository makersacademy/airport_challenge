require 'weather'

RSpec.describe WeatherCondition do
  describe '#stormy?' do
    context 'stormy' do
      it 'returns 9 when stormy' do
        allow(subject).to receive(:stormy).and_return(9)
      end
      it 'returns true when stormy' do
        allow(subject).to receive(:stormy).and_return(true)  
      end
    end

    context 'sunny weather' do
      it 'returns false when sunny' do
        allow(subject).to receive(:stormy).and_return(false)
      end
      it 'return 2 when sunny' do
        allow(subject).to receive(:rand).and_return(2)
      end
    end
  end
end
