class Weather
  attr_accessor :stormy

  def initialize
    @stormy = false
  end

  def change_weather
    rand(6).zero? ? @stormy = true : @stormy = false
  end
end
