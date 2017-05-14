class Weather
  def random_weather
    weather = rand(0..10)
    if (weather % 2).zero?
      'Stormy'
    else
      'Sunny'
    end
  end
end
