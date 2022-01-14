# frozen_literal_string: true

require 'weather'

RSpec.describe Weather do
  let(:weather) { described_class.new }

  it { is_expected.to respond_to(:rare_stormy_weather?) }

  describe '#rare_stormy_weather?' do
    it 'returns boolen value' do

      expect(weather.rare_stormy_weather?).to be(true).or be(false)
    end

    it 'returns true when random_number is equal to one' do
      srand(123_456)

      expect(weather.rare_stormy_weather?).to eq true
    end

    it 'returns false when random_number does not eq 1' do
      srand(1)

      expect(weather.rare_stormy_weather?).to eq false
    end
  end
end
