class Weather
  def stormy?
    record_weather == "stormy"
  end

  private
  def record_weather
    ["stormy", "clear", "clear", "clear", "clear"].sample
  end
end
