class Weather

  def weather_state
    rand(1..10)
  end

  def stormy?
    return true if weather_state == 10

    false
  end

end
