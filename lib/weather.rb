# Final Version

class Weather
  def forecast
    magic_8_ball < 90 ? "Safe" : "Stormy"
  end

  def magic_8_ball
    rand(1 - 100)
  end

  def good_weather?
    forecast != "Stormy"
  end
end
