
class Weather

  WEATHER_CONDITIONS = %w(Sunny Stormy)

  def current_weather
    Random.new.rand(5) <= 3 ? WEATHER_CONDITIONS[0] : WEATHER_CONDITIONS[1]
  end

end
