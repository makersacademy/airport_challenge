class Weather
  # 0.1 = 10% chance
  CHANCE_OF_STORM = 0.1

  def self.current_weather
    rand <= CHANCE_OF_STORM ? :stormy : :clear
  end
end
