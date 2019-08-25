class Weather
  def weather_condition
    number = rand(10)
    number == 9 ? :stormy : :sunny
  end
end
