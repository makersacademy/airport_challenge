module Weather
  WEATHER_TYPES = ['stormy', 'safe']

  def self.forecast
    WEATHER_TYPES.sample
  end
end
