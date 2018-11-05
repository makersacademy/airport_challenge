class Weather

  attr_accessor :weather

  def initialize
    weather_choices = ["stormy", "sunny"]
    @weather = weather_choices.sample
  end

  def setweather(weather)
    @weather = weather
    return "It is #{@weather}"
  end
end
