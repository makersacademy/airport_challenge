describe Plane do
  describe '#flying' do
    it 'returns true when flying' do
      sunny_weather = instance_double("WeatherForecaster", :current => "Sunny")
      airport = Airport.new(weather: sunny_weather)
      plane = airport.hangar[0]
      airport.take_off(plane)
      expect(plane.flying).to eq(true)
    end
    it 'returns false when plane first created' do
      expect(subject.flying).to eq(false)
    end
    it 'returns false when plane has landed' do
      sunny_weather = instance_double("WeatherForecaster", :current => "Sunny")
      airport = Airport.new(weather: sunny_weather)
      plane = airport.hangar[0]
      airport.take_off(plane)
      airport.land(plane)
      expect(subject.flying).to eq(false)
    end
  end
end
