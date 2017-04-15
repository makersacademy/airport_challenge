class Weather

  def check_weather
    raise "No taking off or landing allowed while weather is stormy." if self.stormy?
  end

  def stormy?
    a = rand(2)
    a == 1 ? true : false
  end
end
