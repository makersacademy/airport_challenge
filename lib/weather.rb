class Weather
  attr_reader :stormy
  def initialize
    @stormy = random_weather
  end

  def random_weather
    rand(1..10) > 7
  end

  def stormy?
    stormy
  end
end
