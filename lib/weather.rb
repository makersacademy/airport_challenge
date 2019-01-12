module Weather
  WEATHER_TYPES = ['stormy', 'safe']

  def self.current
    WEATHER_TYPES.sample
  end
end
