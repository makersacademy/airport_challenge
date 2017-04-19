class Weather

  attr_reader :stormy

  def initialize
    @stormy = random_weather
  end

  def random_weather
  rand(101) > 70
  end

  def stormy?
    stormy
  end

end
