require 'weather'

RSpec.describe Weather do
  describe '#stormy?' do
    context 'stormy' do
      it 'can be stormy' do
        weather = Weather.new
        allow(Kernel).to receive(:rand).and_return(9)
        expect(weather.stormy?).to eq true
      end
    end

    context 'sunny weather' do
      it 'can be sunny' do
        weather = Weather.new
        allow(Kernel).to receive(:rand).and_return(2)
        expect(weather.stormy?).to eq false
      end
    end
  end
end
