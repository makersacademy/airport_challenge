class Weather
  def initialize
    @stormy = random_weather
  end

  def stormy?
    stormy
  end

  private

  attr_reader :stormy

  def random_weather
    random.zero?
  end

  def random
    Random.rand(5)
  end
end
