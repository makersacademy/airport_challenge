require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hangar, :capacity

  CAPACITY = 1

  def initialize(capacity = CAPACITY, weather = Weather.new, hangar = [])
    @capacity = capacity
    @weather = weather
    @hangar = hangar
  end

  def land(plane)
    fail 'Airport full' if full?
    fail 'Plane already landed' if plane_in_hangar(plane)
    fail 'Plane in another airport' unless plane_flying?(plane)
    fail 'Too stormy to land' if too_stormy?
    @hangar << plane
    plane.location = object_id
  end

  def takeoff(plane)
    fail 'Plane not in airport' unless plane_in_hangar(plane)
    fail 'Too stormy to take off' if too_stormy?
    @hangar.delete(plane)
    plane.location = 'flying'
  end

  private

  def full?
    @hangar.length >= @capacity
  end

  def plane_in_hangar(plane)
    @hangar.include?(plane)
  end

  def plane_flying?(plane)
    plane.location == 'flying'
  end

  def too_stormy?
    @weather.stormy?
  end
end
