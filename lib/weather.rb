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
    # 10% chance of stormy weather
    [[:stormy], [:sunny] * 9].flatten.sample
  end

end
