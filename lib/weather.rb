class Weather

  attr_accessor :weather

  def initialize()
  @weather = "OK"
  end

  def setweather(weather)
    @weather = weather
    return "The weather is #{@weather}"
  end
end
