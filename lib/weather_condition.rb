class Weather

  def random_weather
    @weather_condition = ['stormy', 'sunny', 'sunny', 'sunny'].sample
  end

  def stormy?
    @weather_condition == "stormy" ? true : false
  end

end
