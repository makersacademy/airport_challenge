class Weather
  attr_reader :stormy, :weather_randomiser

  def initialize
    @stormy = weather_randomiser
  end

  def stormy?
    stormy
  end

  def weather_randomiser
    Kernel.rand <= 0.05
  end
end
