class Airport

  attr_accessor :planes
  attr_reader :weather

  def initialize
    @planes = []
    @weather = set_weather
  end

  def weather_report
    print "Today's weather is #{@weather}"
    set_weather
  end

private

  def set_weather
    rand(9) < 2? "stormy" : "fine"
  end


end
