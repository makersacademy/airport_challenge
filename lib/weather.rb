class Weather
  
  def stormy?
    WEATHER_TYPES[Kernel.rand(WEATHER_TYPES.length)]
  end

  private

  WEATHER_TYPES = [:rainy, :sunny, :stormy]

end
