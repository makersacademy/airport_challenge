class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :planes
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = set_weather
    @capacity = capacity
  end

  def weather_report
    set_weather
    print "Today's weather is #{@weather}"
  end

  def is_full?
    true if planes.count >= DEFAULT_CAPACITY
  end

  private

  def set_weather
    chance < 2? "stormy" : "fine"
  end

  def chance
    rand(9)
  end

end
