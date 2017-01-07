class Weather

  @@sunny = true

  def self.sunny?
    self.set_weather
    @@sunny
  end

  private

  def self.set_weather
    @@sunny = self.is_weather_sunny?
  end

  def self.is_weather_sunny?
    self.randomize > 20 ? true : false
  end

  def self.randomize
    rand(100)
  end
end
