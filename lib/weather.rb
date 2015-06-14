module Weather

  def report
    weather_genarator = rand(365)
    return :sunny if weather_genarator <= 300
    return :stormy
  end

end