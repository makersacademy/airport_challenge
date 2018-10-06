class Weather

  def weather_generator
    weather = Random.rand(1..6)
    weather <= 4 ? "sunny" : "stormy"
  end

end
