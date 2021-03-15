require 'weather'

module SafeWeather

  attr_reader :weather

  def self.wind(weather)
    weather.strength_of_wind <= 10
  end

  def self.storm(weather)
    weather.strength_of_wind <= 6 && weather.chance_of_rain <= 40
  end

  def self.snow(weather)
    weather.chance_of_rain <= 50 && weather.temperature >= 0
  end

  def self.winter(weather)
    weather.temperature >= 0 && weather.strength_of_wind <= 7
  end

  def self.freezing(weather)
    weather.temperature > -20
  end

  def self.safety_check(weather)
    wind(weather) &&
    storm(weather) &&
    snow(weather) &&
    winter(weather) &&
    freezing(weather)
  end

end
