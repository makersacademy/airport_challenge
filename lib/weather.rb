class Weather

  def forecast
    weather_num = rand(0..100)
    if weather_num <=80
        return "sunny"
    else
        return "stormy"
    end
  end

end
