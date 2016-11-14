class Weather

  attr_accessor :weather_code

  def initialize
    @weather_code = 1 + rand(6)
  end

  def stormy?
    @weather_code < 3
  end

end
