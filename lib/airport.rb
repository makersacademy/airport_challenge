require_relative "weather"

class Airport

  DEFAULT_CAPACITY = 5

  attr_reader :planes, :conditions, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    fail "Capacity of nil not allowed." if capacity == nil
    @capacity = capacity
    @planes = []
    @conditions
  end

  def land(plane)
    fail "Too stormy to land!" if @conditions == "stormy"
    fail "Can't land airport full." if full?
    planes << plane
  end

  def landed?(plane)
    planes.include?(plane)
  end

  def take_off(plane)
    fail "Stormy weather! Not safe to fly." if @conditions == "stormy"
    planes.delete(plane)
  end

  def weather_conditions(weather)
    @conditions = weather.forecast
  end

  def full?
    planes.count >= capacity
  end

end
