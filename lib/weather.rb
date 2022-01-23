class Weather

  def random_weather(force_storm = false)
    return :stormy unless force_storm == false
    return :sunny unless rand(10) == 1
    return :stormy
  end
end
