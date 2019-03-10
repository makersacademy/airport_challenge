class WeatherStation
  CHANCE_OF_STORM = 0.1
  def status
    rand < CHANCE_OF_STORM ? "⛈" : "☀️"
  end
end
