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
    rand(2).zero?
  end
end
