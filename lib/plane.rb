require_relative './exceptions'
require 'weather'

class Plane

  def initialize
    @flying = false
  end

  def land
    raise PlaneError, "Plane already on the ground" unless @flying
    @flying = false
  end

  def take_off
    raise PlaneError, "Plane already in-flight" if flying?
    @flying = true
  end

  def flying?
    @flying
  end

end
