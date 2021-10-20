WEATHER_STATES = { stormy: true, not_stormy: false }.freeze

class Weather
  def stormy?
    return WEATHER_STATES[:not_stormy] if rand(100) < 90
    WEATHER_STATES[:stormy]
  end
end

