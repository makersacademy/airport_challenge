class Weather

  def stormy?
    weather == :stormy?
  end

private

WEATHER_CONDITION = [:stormy, :clear, :clear, :clear]

def weather
  WEATHER_CONDITION.sample
end
end
