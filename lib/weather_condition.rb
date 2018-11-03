class Weather
  attr_reader :weather_condition

  def random_weather
    @weather_condition = ['stormy', 'sunny', 'sunny', 'sunny'].sample
  end

end
