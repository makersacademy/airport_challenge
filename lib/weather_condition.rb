class Weather
  attr_reader :weather_condition
  def random_weather
    @weather_condition = ['stormy', 'sunny', 'sunny', 'sunny'].sample
  end
  def bad_weather?
    @weather_condition == 'stormy'? true : false
  end
end
