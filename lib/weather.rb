class Weather

  def generate
    weather_types = ["rainy", "sunny", "stormy"]
    Kernel.rand(weather_types.length)
  end

end