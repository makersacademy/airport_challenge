class Weather
  attr_reader :stormy

  def initialize
    @stormy = weather_random
  end

  def weather_random
    # false
    rand(6).zero?
  end
end
