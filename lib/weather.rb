class Weather
  def weather
    random = rand(1..10)
    random > 8 ? true : false
  end
end
