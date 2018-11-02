class Weather

  attr_accessor :weather

  def initialize
    @weather = "OK"
  end

  def setweather(weather)
    @weather = weather
    return "It is #{@weather}"
  end
end
