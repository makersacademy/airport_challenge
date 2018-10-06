class Weather

  def weather_generator
    weather = Random.rand(1..3)
    weather <= 2 ? "sunny" : "stormy"
  end

end
