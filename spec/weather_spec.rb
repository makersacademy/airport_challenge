require 'weather'

describe Weather do

  # doubles
  let(:bad_weather) { described_class.new(Random.rand(1..2)) }
  let(:good_weather) { described_class.new(Random.rand(3..10)) }

  # unit tests
  describe '#initialize' do
    it 'creates a sunny weather w/ probability of 80%' do
      expect(good_weather.stormy).to eq false
    end
    it 'creates a sunny weather w/ probability of 20%' do
      expect(bad_weather.stormy).to eq true
    end
  end
end
