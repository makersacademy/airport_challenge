module Weather

def weather
  weather = []
  weather_select = Random.new
  weather_select = weather_select.rand(2)
    if weather_select == 0
      weather << 'stormy'
    elsif weather_select == 1
      weather << 'sunny'
    end
  weather
  end

end
