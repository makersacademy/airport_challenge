class Weather

  WEATHER_TYPES = [:rainy, :sunny, :stormy].freeze
  
  def initialize
    @today = WEATHER_TYPES[Kernel.rand(WEATHER_TYPES.length)]
  end

  def is
    @today
  end

  def stormy?
    @today == :stormy
  end
end
