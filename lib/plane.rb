require_relative 'airport'

class Plane

  def initialize
    @flying = true
  end

  def land airport
    airport.land_request self
    @flying = false
  end

  def take_off airport
    @flying = true
  end

  def flying?
    @flying
  end

  def landed?
    return true unless @flying
  end
end
