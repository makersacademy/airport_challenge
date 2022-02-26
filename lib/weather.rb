class Weather
  def self.weather_report
    WEATHER_CONDITIONS.sample
  end

  private

  WEATHER_CONDITIONS = [
    "Sunny",
    "Cloudy",
    "Windy",
    "Rainy",
    # "Stormy",
  ].freeze
end