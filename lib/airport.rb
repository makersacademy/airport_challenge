require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :hangar
  attr_reader :weather
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    raise "Plane has already landed" if plane.flying == false
    raise 'Unable to land due to stormy weather' if weather.stormy?
    raise "Can't land, airport is full" if hangar.length >= capacity

    plane.is_not_flying
    @hangar << plane
  end

  def take_off(plane)
    raise "Plane is already in the air" if plane.flying == true
    raise 'Unable to take off due to stormy weather' if weather.stormy?

    plane.is_flying
    @hangar.delete(plane)
  end

end
