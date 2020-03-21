class Weather
  # 0.1 = 10% chance
  CHANCE_OF_STORM = 100
  STORMY = :stormy
  CLEAR = :clear

  def self.current_weather
    rand <= CHANCE_OF_STORM ? :stormy : :clear
  end
end
