require 'weather'

describe Weather do

  subject(:weather) {Weather.new}

  describe '#stormy' do

    context 'Stormy Weather' do   
      it 'returns true for stormy weather' do
        # use a stub to fake a result from :rand
        allow(weather).to receive(:rand).with(0..9) {9}
        weather.randomize
        expect(weather.stormy).to be_truthy
      end
    end
    context 'Sunny weather' do
      it 'returns false for sunny weather' do
        # use a stub to fake a result from :rand
        allow(weather).to receive(:rand).with(0..9) {0}
        weather.randomize
        expect(weather.stormy).to be_falsy
        allow(weather).to receive(:rand).with(0..9) {3}
        weather.randomize
        expect(weather.stormy).to be_falsy
        allow(weather).to receive(:rand).with(0..9) {5}
        weather.randomize
        expect(weather.stormy).to be_falsy
      end
    end

  end

end