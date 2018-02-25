require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe 'check weather condition' do
    it 'returns false if weather stormy' do
      allow_any_instance_of(Array).to receive(:sample).and_return("stormy")
      expect(weather.weather_ok?).to eq false
    end
  end
end
