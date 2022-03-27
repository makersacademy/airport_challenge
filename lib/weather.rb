class Weather

  WEATHER_TYPES = [:rainy, :sunny, :stormy].freeze

  def check
    @today = WEATHER_TYPES[Kernel.rand(WEATHER_TYPES.length)]
  end

  def stormy?
    @today == :stormy
  end
end
