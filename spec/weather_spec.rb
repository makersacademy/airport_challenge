require 'weather'

describe Weather do

  subject(:weather) {Weather.new}

  describe '#stormy?' do

    context 'Stormy Weather' do   
      it 'returns true for stormy weather' do
        # use a stub to fake a result from :rand
        allow(weather).to receive(:rand).with(0..9) {9}
        expect(weather).to be_stormy
      end
    end
    context 'Sunny weather' do
      it 'returns false for sunny weather' do
        # use a stub to fake a result from :rand
        allow(weather).to receive(:rand).with(0..9) {1}
        expect(weather).to_not be_stormy
        allow(weather).to receive(:rand).with(0..9) {3}
        expect(weather).to_not be_stormy
        allow(weather).to receive(:rand).with(0..9) {6}
        expect(weather).to_not be_stormy
        allow(weather).to receive(:rand).with(0..9) {8}
        expect(weather).to_not be_stormy
        allow(weather).to receive(:rand).with(0..9) {0}
        expect(weather).to_not be_stormy
      end
    end

  end

end