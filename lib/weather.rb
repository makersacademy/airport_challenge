class Weather
  def is_stormy?
    weather = rand(10)
    weather < 3 ? true : false
  end
end