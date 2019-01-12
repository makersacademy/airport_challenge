class Weather

  def generate_weather
    if rand(11) >= 9
      'stormy'
    else
      'sunny'
    end
  end

  def weather
    generate_weather
  end

end