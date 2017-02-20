class Weather

WEATHER_STATUS = [:stormy, :fine, :fine, :fine]

  def initialize
    @status
  end
  
  def current_weather
    @status = WEATHER_STATUS.sample
  end

  def stormy?
    @status == :stormy
  end

end
