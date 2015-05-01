module WeatherContainer
  def stormy?
    Random.rand(1..10).even? ? true : false
  end
end