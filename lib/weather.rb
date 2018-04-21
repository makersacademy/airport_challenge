module Weather

  def stormy?
    generate_weather
  end

  def generate_weather
    rand(10) > 7 ? true : false
  end

end
