
class Weather
  attr_reader :weather

  def stormy?
    weather_possibilities = [:storm,:no_storm,:no_storm,:no_storm]
    possibility = weather_possibilities[rand(0..3)]
    possibility == :storm

  end
end
