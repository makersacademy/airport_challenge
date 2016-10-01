class Weather
  def initialize
    @stormy = random_weather
  end
  attr_reader :stormy

  def random_weather
    rand(1..10) > 7
  end

  def stormy?
    stormy
  end
end
