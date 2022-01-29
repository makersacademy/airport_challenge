require_relative 'plane'
class Airport

  attr_reader :capacity

  DEFAULT_AIRPORT_CAPACITY = 1

  def initialize(capacity = DEFAULT_AIRPORT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Bad weather: can't land" if stormy?
    full? ? (raise "Airport is full. Can't land") : @planes << plane
  end

  def take_off(plane)
    (raise "Bad weather: can't take off") if stormy?
    (raise "No planes available to fly") if empty? 
    "flight #{plane} has taken off from runway 1"
  end

  def stormy?
    rand(10) > 7
  end

  private

  def full?
    @planes.size >= capacity
  end

  def empty?
    @planes.empty?
  end

end
