require_relative 'plane'

class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 100

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'Landing denied, airport is full!' if @planes.length >= @capacity
    @planes << plane
    plane
  end

  def take_off(plane)
    raise 'Plane has left the airport!' unless planes.include? plane
    @planes.delete(plane)
  end

end
