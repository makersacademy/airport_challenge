class Weather

  def stormy?
    weather_conditions == :stormy
  end

  def weather_conditions
    [:stormy, :clear, :cloudy, :rain].sample
  end
  
end
