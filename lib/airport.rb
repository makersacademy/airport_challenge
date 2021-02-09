require_relative 'weather'
require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :parked

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @parked = []
  end

  def land(plane, weather = Weather.new)
    raise "Can't land - The plane is already grounded" unless plane.flying
    raise "Can't land, airport full" if full?
    raise "Can't land, too stormy" if weather.stormy?

    plane.flying = false
    @parked << plane
    "Plane landed"
  end

  def takeoff(plane, weather = Weather.new)
    raise "Can't take off - The plane is already flying" if plane.flying
    raise "Can't take off - The plane is not at this airport" unless @parked.include?(plane)
    raise "Can't take off, too stormy" if weather.stormy?

    plane.flying = true
    @parked.delete plane
    "Plane departed"
  end

  def full?
    @parked.length >= capacity
  end

end
