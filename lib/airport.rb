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
    raise("Plane is already in the hangar") if @hangar.include?(plane)
    raise("Cannot land in stormy weather") if weather.stormy?
    raise("Airport is full!") if full?
    raise("This plane has already landed") if plane.landed?
    plane.land
    @hangar << plane
  end

  def takeoff(plane)
    raise("This plane is already flying") if plane.flying?
    raise("Plane is not at airport") unless @hangar.include?(plane)
    raise("Cannot takeoff in stormy weather") if weather.stormy?
    plane.fly
    @hangar.delete(plane)
  end

  private
  attr_reader :weather

  def full?
    return true if @hangar.count == @capacity
  end
end
