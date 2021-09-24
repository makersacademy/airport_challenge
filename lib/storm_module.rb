require_relative 'plane'

class Weather
  def initialise = current_weather(forecast)
    current_weather = forecast
  end

  def storm
    chance = rand(6)
    if chance == 5
      return current_weather = "storm"
    else
      return current_weather = "clear"
    end
  end
end