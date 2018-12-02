describe Weather do
  subject(:weather) { Weather.new }

  describe '#random_number' do
    it 'returns 1 or 2 at random' do
      expect(weather.random_number).to be_between(1, 2)
    end
  end

  describe '#weather_forecast' do
    it 'responds to .weather_forecast' do
      expect(weather).to respond_to(:weather_forecast).with(1).argument
    end

    it 'returns sunny when 1 passed as argument' do
      expect(weather.weather_forecast(1)).to eq 'sunny'
    end

    it 'returns stormy when 2 passed as argument' do
      expect(weather.weather_forecast(2)).to eq 'stormy'
    end
  end
end
