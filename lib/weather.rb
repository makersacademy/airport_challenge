class Weather
  def weather
    rand(1..10)
  end
  
  def check
    weather > 5 ? false : true
  end
end
