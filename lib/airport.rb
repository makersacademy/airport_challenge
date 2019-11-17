class Airport

  attr_reader :planes
  attr_reader :weather
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    todays_weather = @weather.generate
    fail "There's a storm. No landing." if todays_weather == "Stormy weather!"

    fail "The airport is full." if @planes.size >= @capacity

    print "Plane landed!"
    @planes << plane
  end

  def take_off
    # weather = Weather.new
    todays_weather = @weather.generate
    fail "There's a storm. No flying." if todays_weather == "Stormy weather!"

    print "Plane has taken off!"
    @planes.pop
  end

end
