require 'weather'

describe Weather do

  it { is_expected.to respond_to(:stormy) }

  let(:bad_weather) { described_class.new(Random.rand(1..20)) }
  let(:good_weather) { described_class.new(Random.rand(21..100)) }

  describe '#initialize' do

    it 'creates a sunny weather w/ probability of 80%' do
      expect(good_weather.stormy).to eq false
    end

    it 'creates a sunny weather w/ probability of 20%' do
      expect(bad_weather.stormy).to eq true
    end
  end
end
