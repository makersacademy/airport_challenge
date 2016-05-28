class Weather
  def state
    weather_state
  end

  private
  def weather_state
    ["sunny", "stormy"].sample
  end
end
