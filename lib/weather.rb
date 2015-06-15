module Weather
  def report
    weather_genarator = rand(365)
    :sunny if weather_genarator <= 300
    :stormy
  end
end