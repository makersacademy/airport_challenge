class Weather

  def weather_state
    rand(1..5)
  end

  def stormy?
    return true if weather_state == 5

    false
  end

end
