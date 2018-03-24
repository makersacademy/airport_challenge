class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :weather
  attr_accessor :planes_in_airport

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_in_airport = []
    @weather = "clear"
    @capacity = capacity
  end

  def takeoff
    @planes_in_airport.pop
  end

  def airport_full?
    @planes_in_airport.size >= @capacity
  end

end
