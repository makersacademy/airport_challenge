class Weather
  def stormy?
    weather = rand(10)
    weather < 8 ? false : true
  end
end
