class Weather
  def good_weather?
    random_weather = 10 # 1 in 10 chance of bad weather
    return rand(random_weather) != 3
  end
end
