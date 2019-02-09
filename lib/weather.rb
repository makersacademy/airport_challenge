class Weather
  def state
    goodweather = ["sunny"]
    weather = ["sunny", "stormy"].sample
    goodweather.include?(weather) ? true : false
  end
end
