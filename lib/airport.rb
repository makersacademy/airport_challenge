require_relative 'plane'
require_relative 'weather'
class Airport
   def land(plane)
     raise "Airport is full" if Plane.new
    # raise "Landing not allowed due to stormy weather" if is_stormy
    Plane.new
  end

  def take_off(plane)
    # raise "Planes won't take off due to stormy weather" if is_stormy
    @plane
  end

private
  def is_stormy
  Weather.new.stormy?
  end
end
