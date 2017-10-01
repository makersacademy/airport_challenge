require 'weather'

describe Weather do

  subject(:weather) {described_class.new}

  describe '#stormy?' do

    context 'Stormy Weather' do   
      it 'returns true for stormy weather' do
        allow(weather).to receive(:randomize) {:stormy}
        expect(weather.stormy?).to be_truthy
      end
    end
    context 'Sunny weather' do
      it 'returns false for sunny weather' do
        allow(weather).to receive(:randomize) {:sunny}
        expect(weather.stormy?).to be_falsy
      end
    end

  end

end