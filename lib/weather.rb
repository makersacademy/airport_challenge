class Weather
  attr_reader :wind_speed

  def initialize
    @wind_speed = (rand * 41).floor
  end

  def stormy?

  end
end
