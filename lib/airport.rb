require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 19

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @hangar = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise("Plane has already landed") if @hangar.include?(plane)
    raise("Cannot land in stormy weather") if weather.stormy?
    raise("Airport is full!") if full?
    @hangar << plane
    "Plane has landed"
  end

  def takeoff(plane)
    raise("Plane is not at airport") unless @hangar.include?(plane)
    raise("Cannot takeoff in stormy weather") if weather.stormy?
    @hangar.delete(plane)
    "Plane has taken off"
  end

  private
  attr_reader :weather

  def full?
    return true if @hangar.count == @capacity
  end
end
