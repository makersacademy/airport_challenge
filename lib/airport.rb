class Airport
  WEATHER_STATE = ["sunny", "mild", "cloudy", "misty", "rainy", "stormy"]

  def report_weather
    WEATHER_STATE.sample
  end

  def prevent_take_off
    report_weather == "stormy"
  end
end
