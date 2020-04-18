require_relative 'plane'

class Airport
  attr_writer :capacity

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @parked_planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if full?
    @parked_planes << plane
    # @parked_planes << plane unless @parked_planes.include? plane
  end

  def take_off
    fail "Elvis has left the bulding" if @parked_planes
    @parked_planes.shift
  end

  def full?
    @parked_planes.size >= @capacity 
  end

  def stormy?
    ["sunny", "cloudy", "rainy", "stormy"].sample == "stormy" ? true : false
  end

end
