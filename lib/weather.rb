class Weather
  def check_weather
    if rand(100) < 75
      :sunny
    else
      :stormy
    end
  end
end
