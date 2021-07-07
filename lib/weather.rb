class Weather

  def makeweather
    weather = ['sunny', 'sunny', 'sunny', 'sunny',
               'sunny', 'sunny', 'sunny', 'sunny',
               'sunny', 'sunny', 'sunny', 'sunny',
               'sunny', 'sunny', 'sunny', 'stormy']
    @condition = weather[rand(weather.length - 1)]
  end

  def stormy?
    makeweather
    @condition == 'stormy'
  end
end
