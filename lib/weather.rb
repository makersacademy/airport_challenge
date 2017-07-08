class Weather

  def initialize(weather = nil)
    @weather = weather || random_weather
  end

  def stormy?
    weather == :stormy
  end

  private
  attr_reader :weather

  def random_weather
    # 5% chance of stormy weather
    [[:stormy], [:sunny] * 19].flatten.sample
  end

end
