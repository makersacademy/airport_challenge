require 'weather'

describe Weather do
  subject(:weather) { described_class.new }
  storm_seed = (1..100).find { |n| srand(n); rand(Weather::SUNNINESS) == 0 }
  sun_seed = storm_seed - 1

  describe '#stormy?' do
    context 'in sunny weather' do
      it 'can confirm that weather is not stormy' do
        srand(sun_seed)
        expect(subject.stormy?).to eq false
      end
    end

    context 'in stormy weather' do
      it 'can confirm that weather is stormy' do
        srand(storm_seed)
        expect(subject.stormy?).to eq true
      end
    end
  end
end
