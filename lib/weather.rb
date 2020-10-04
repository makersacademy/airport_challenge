class Weather
  attr_reader :weather
  @stromy = false
  def initialize
    @weather = rand(1..20)
  end

  def weather_report
    @weather >= 10 ? @stormy = true : @stromy = false
  end
end
