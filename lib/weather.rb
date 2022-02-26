class Weather
  def generate
    weather_types = [:rainy, :sunny, :stormy]
    weather_types[Kernel.rand(weather_types.length)]
  end
end
