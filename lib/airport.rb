class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :weather
  attr_accessor :planes_in_airport

  def initialize
    @planes_in_airport = []
    @weather = "clear"
  end

  def takeoff
    @planes_in_airport.pop
  end

end
