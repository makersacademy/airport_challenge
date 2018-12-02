class Weather

  def random_weather
    rand(1..2)
  end

  def weather_condition

    case random_weather
    when 1 then @stormy = true
    when 2 then @stormy = false
    end

  end

end
