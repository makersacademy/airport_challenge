class Weather

  def check_weather
    raise "No taking off or landing allowed while weather is stormy." if stormy?
  end

  def stormy?
    rand(2) == 1 ? true : false
  end
end
