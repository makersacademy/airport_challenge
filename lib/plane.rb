require_relative './exceptions'

class Plane

  def initialize
    @flying = true
  end

  def land(airport)
    raise PlaneError, "Plane already on the ground" unless flying?
    @flying = false
    @location = airport
  end

  def take_off
    raise PlaneError, "Plane already in-flight" if flying?
    @flying = true
    @location = nil
  end

  def flying?
    @flying
  end

  def location?
    @location || "In-flight"
  end

end
