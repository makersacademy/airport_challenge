describe Weather do
  subject(:weather) { Weather.new }

  describe '#random_number' do
    it 'returns 1 or 2 at random' do
      expect(weather.random_number).to be_between(1, 2)
    end
  end

  describe '#weather_forecast' do
    it 'returns sunny when 1 passed as argument' do
      expect(weather.weather_forecast(1)).to eq 'sunny'
    end

    it 'returns stormy when 2 passed as argument' do
      expect(weather.weather_forecast(2)).to eq 'stormy'
    end
  end

end
