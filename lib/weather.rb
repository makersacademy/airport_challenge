class Weather

  WEATHER_STATUS = [:stormy, :sunny, :sunny, :sunny]

  def initialize
    @status
  end

  def current_weather
    @status = WEATHER_STATUS.sample
  end

  def check
    @status
  end

  def is_sunny?
    return true if current_weather == :sunny
  end

end
