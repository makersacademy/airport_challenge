class Weather
 
  def weather_today 
    Random.rand(1..10) < 7 ? true : "stormy"     
  end
end
