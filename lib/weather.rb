class Weather
  attr_reader :stormy

  def initialize
    @stormy = random_weather
  end

  def random_weather
    return false if rand < 0.9
    true
  end

end
