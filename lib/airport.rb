require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :planes_in_airport

  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_in_airport = []
  end

  def land(plane)
    raise "Unable to land. Airport has reached its maximum capacity" if full?
    raise "Cannot land due to stormy conditions!" if stormy?
    print "#{plane} has landed"
    @planes_in_airport << plane
  end

  def take_off(plane)
    raise "Cannot take off due to stormy conditions!" if stormy?
    print "#{plane} is no longer in airport"
    @planes_in_airport.pop
  end

  def add_plane
    plane = Plane.new
    @planes_in_airport << plane
    return plane
  end

  private

  def full?
    @planes_in_airport.size >= @capacity
  end

end
