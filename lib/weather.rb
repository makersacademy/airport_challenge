class Weather
  def weather
    weather = ['sunny', 'stormy']
    x = rand(1..5)
    x < 4 ? weather[0] : weather[1]
  end
end