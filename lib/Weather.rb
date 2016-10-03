class Weather

  attr_accessor :stormy

  def initialize
      @stormy = random_weather
  end

  def random_weather
    [false, false, true].sample
  end

end
