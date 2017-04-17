class Weather

  def initialize
    @condition = [:fine, :fine, :fine, :stormy]
  end

  def random_weather
    @condition.sample
  end

  def stormy?
    random_weather == stormy
  end

end
