require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 100

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def set_capacity(capacity)
    @capacity = capacity
  end

  def land(plane)
    fail 'Landing denied, airport is full!' if @planes.length >= @capacity
    @planes << plane
    plane
  end

  def take_off(plane)
    @planes.last
  end

end
