require_relative "plane"

class Airport
  DEF_CAPACITY = 20
  DEF_WEATHER = "fair"

  def initialize(capacity = DEF_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane, weather = DEF_WEATHER)
    @weather = weather
    raise "This airport is full." if full?

    raise "Too stormy to land." if stormy?

    @planes << plane
  end

  def takeoff(plane, weather = DEF_WEATHER)
    @weather = weather
    raise "Too stormy for takeoff." if stormy?

    @planes.delete(plane)
  end

  attr_reader :planes
  attr_reader :capacity
  attr_reader :weather

  private
  def full?
    @planes.length == @capacity
  end

  def stormy?
    @weather == "stormy"
  end
end
