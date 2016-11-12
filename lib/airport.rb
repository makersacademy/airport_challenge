require_relative "plane"
class Airport
  DEFAULT_CAPACITY =  10
  attr_reader :planes, :capacity
  attr_accessor :weather
  @weather = rand(101) >= 10 ? "good" : "stormy"

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise "Landing impossible due to stormy weather" if weather == "stormy"
    raise "This airport is full" if planes.size >= capacity
    planes << plane
  end

  def on_airport?(plane)
    if planes.include? plane; true
    else false
    end
  end

  def take_off(plane)
    raise "Take-off impossible due to stormy weather" if weather == "stormy"
    planes.pop
  end

end
