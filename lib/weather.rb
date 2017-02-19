class Weather
#attr_reader :weather

  def todays_forecast
    weather = ['stormy', 'sunny', 'showery', 'cloudy'].sample
  end
end

# My method unsafe and the attr_accessor and writer
# That I tried earlier aren't connected
