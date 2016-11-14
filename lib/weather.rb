class Weather

  attr_accessor :weather_code

  def initialize
    @weather_code = rand
  end

  def stormy?
    @weather_code < 0.3
  end

end
