describe Weather do
  subject(:weather) { Weather.new }

  describe '#stormy?' do
    it 'returns true or false' do
      expect(weather.weather_forecast).to be(true).or be(false)
    end
  end
end
