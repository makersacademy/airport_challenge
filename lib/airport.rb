require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Too stormy to land!' if Weather.stormy?
    fail 'Landing denied, airport is full!' if @planes.length >= @capacity
    @planes << plane
    plane
  end

  def take_off(plane)
    fail 'Too stormy to take off!' if Weather.stormy?
    fail 'Plane has left the airport!' unless planes.include? plane
    @planes.delete(plane)
  end

end
