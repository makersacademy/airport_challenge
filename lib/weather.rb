class Weather

  WEATHER_CONDITIONS = [
    "Sunny",
    "Stormy"
  ].freeze

  def conditions
    WEATHER_CONDITIONS[random]
  end

  private

  def random
    rand(0...WEATHER_CONDITIONS.length)
  end
end
