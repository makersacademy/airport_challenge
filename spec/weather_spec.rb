require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

    describe '#stormy?' do

        it 'returns true when randomly generated number is higher or equal 7' do
          allow(weather).to receive(:rand).and_return 8
          expect(weather.stormy?).to eq true
        end

        it 'returns false when randomly generated number is lower that 7' do
          allow(weather).to receive(:rand).and_return 2
          expect(weather.stormy?).to eq false
        end

    end

end
