require 'weather'

describe Weather do

  subject(:weather) { described_class.new }
  let(:bad_weather) { described_class.new(Random.rand(1..2)) }
  let(:good_weather) { described_class.new(Random.rand(3..10)) }

  it { is_expected.to respond_to(:stormy?) }

  describe '#stormy?' do
    it 'creates a sunny weather' do
      expect(good_weather.stormy?).to eq false
    end

    it 'creates a stormy weather' do
      expect(bad_weather.stormy?).to eq true
    end
  end
end
