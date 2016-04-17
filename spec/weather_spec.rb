require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

    describe '#stormy?' do

        it 'returns true when rand(10) >= 7' do
          allow(weather).to receive(:rand).and_return 8
          expect(weather.stormy?). to eq true
        end

    end

end
