class Weather
  WEATHER_CONDITIONS = [:sunny, :cloudy, :gentle_showers,
                        :terrential_rain, :stormy]

  attr_reader :weather

  def initialize
    @weather = WEATHER_CONDITIONS.sample
  end
end