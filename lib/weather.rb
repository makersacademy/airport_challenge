WEATHER_STATES = { stormy: true, not_stormy: false }.freeze
STORMY_ODDS = [WEATHER_STATES[:not_stormy], WEATHER_STATES[:not_stormy],
               WEATHER_STATES[:not_stormy], WEATHER_STATES[:stormy]].freeze
class Weather
  private def random_weather
    STORMY_ODDS.sample
  end
  def stormy?
    random_weather == WEATHER_STATES[:stormy]
  end
end
