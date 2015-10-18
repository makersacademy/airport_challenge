require_relative 'weather'

class Plane

  def land(airport)
    raise 'Too stormy.' if Weather.stormy?
    airport.land(self)
    @location = airport
    @flying = false
  end

  def take_off
    raise 'Too stormy.' if Weather.stormy?
    @location.take_off(self)
    @location = nil
    @flying = true
  end

  def flying?
    @flying
  end

end
