module WeatherRatioSetter
  def self.array_generator
    weather_weights = { :stormy => 1, :clear => 25 }
    weather_array = []
    
    weather_weights.each do |weather, weight|
      weight.times { weather_array.push(weather) }
    end
    weather_array
  end
end

module Weather
  include WeatherRatioSetter

  def self.weather_forecast
    weather_states = WeatherRatioSetter.array_generator
    number = rand(weather_states.size)
    weather_states[number]
  end
end
  