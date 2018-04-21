require_relative './exceptions'

class Plane

  def initialize
    @flying = true
  end

  def land(airport)
    @flying = false
    @location = airport
  end

  def take_off
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
