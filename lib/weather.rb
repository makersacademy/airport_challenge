class Weather
  attr_reader :outlook

  def initialize
    @outlook = set_weather
  end

  def stormy?
    @outlook == :stormy
  end

  private

  OUTLOOK_TYPES = [:stormy, :sunny, :sunny, :cloudy, :cloudy, :rainy]

  def set_weather
    OUTLOOK_TYPES.sample
  end
end
