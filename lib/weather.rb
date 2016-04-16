class Weather
  def self.sunny?
    self.weather_severity < 5
  end

  private
  def self.weather_severity
    rand(0..10)
  end
end
