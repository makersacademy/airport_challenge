class Airport

  attr_accessor :planes
  attr_reader :weather

  def initialize
    @planes = []
    @weather = set_weather
  end

  def weather_report
    set_weather
    print "Today's weather is #{@weather}"
  end

  private

  def set_weather
    chance < 2? "stormy" : "fine"
  end

  def chance
    rand(9)
  end

end
