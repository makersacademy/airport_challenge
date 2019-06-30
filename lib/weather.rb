class Weather
  attr_reader :stormy

  def initialize
    @stormy = false
  end

  def stormy_weather
    @stormy = true
  end
end
