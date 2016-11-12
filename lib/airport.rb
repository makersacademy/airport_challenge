require_relative "plane"
class Airport

  DEFAULT_CAPACITY =  10
  @weather = rand(101) >= 90 ? "good" : "stormy"

  attr_reader :planes
  attr_accessor :weather, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Landing impossible due to stormy weather" if stormy?
    raise "This airport is full" if full?
    plane.state = "landed"
    planes << plane
  end

  def on_airport?(plane)
    if planes.include? plane; true
    else false
    end
  end

  def take_off(plane = planes.last)
    raise "Take-off impossible due to stormy weather" if stormy?
    raise "This plane is not present at this airport!" if !(on_airport?(plane))
    planes.delete(plane)
  end

  private
  def stormy?
    weather == "stormy"
  end

  def full?
    planes.size >= capacity
  end

end
