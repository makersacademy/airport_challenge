class Weather

  def random_weather
    rand(1..2)
  end

  def weather_condition
    case random_weather
    when 1
      @stormy = true
    else
      @stormy = false
    end
  end

end
