require_relative 'plane'
require_relative 'weather'

class Airport 

  DEFAULT_CAPACITY = 20
  
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Plane cannot land. Airport is full" if full?
    @planes << plane
    return "The plane has landed"
  end

  def take_off(plane)
    raise "The airport is empty" if empty?
    @planes.delete(plane)
    return "The plane has taken off and left the airport"
  end

private

# def stormy?
#   weather.stormy?
# end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= @capacity
  end
end
