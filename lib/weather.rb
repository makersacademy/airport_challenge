module Weather

  def stormy?
    weather == :Stormy
  end

  def weather
    weather_type = [:Sunny, :Sunny, :Sunny, :Sunny, :Stormy]
    weather_type.sample
  end
end
