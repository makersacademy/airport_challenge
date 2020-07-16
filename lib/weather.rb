class Weather
  def getweather
    weatherseed = rand(1..10)
    if weatherseed == 10
      "stormy"
    else
      "sunny"
    end
  end
end
