class Weather
  def weather_ok?
    generate_weather == 'sunny'
  end

  private

  def generate_weather
    ['sunny', 'stormy'].sample
  end
end
