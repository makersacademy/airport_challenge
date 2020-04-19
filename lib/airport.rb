require_relative 'plane'

class Airport
  attr_accessor :capacity, :parked_planes

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @parked_planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if full? 

    fail "No landing allowd due storm" if stormy? 

    # @parked_planes << plane
    @parked_planes << plane unless @parked_planes.include? plane
  end

  def take_off
    fail "No flights allowd due storm" if stormy?

    fail "No planes at the airport" if empty?

    @parked_planes.shift
    print "Elvis has left the bulding"
  end

  def full?
    @parked_planes.size >= @capacity 
  end

  def empty?
    @parked_planes.empty?
  end

  def stormy?
    ["sunny", "cloudy", "rainy", "stormy"].sample == "stormy"
  end

end
