class WeatherSpec

  include Weather

  describe WeatherSpec do

    it 'weather status will read either sunny or stormy' do
      weather_states = ['sunny', 'stormy']
      expect(weather_states.include? subject.weather).to be true
    end

    it 'request for weather update will read either sunny or stormy' do
      weather_states = ['sunny', 'stormy']
      expect(weather_states.include? subject.weather).to be true
    end

  end

end