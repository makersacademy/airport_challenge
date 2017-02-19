class Weather

WEATHER_STATUS = [:stormy, :fine, :fine, :fine]

  def current_weather
    @status = WEATHER_STATUS.sample
  end

end
