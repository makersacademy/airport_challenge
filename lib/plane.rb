require_relative 'weather'

class Plane

  attr_reader :location

  def initialize
    @flying = true
  end

  def land(airport)
    raise 'Already landed.' unless flying?
    raise 'Too stormy.' if Weather.stormy?
    airport.land(self)
    @location, @flying = airport, false
  end

  def take_off
    raise 'Already flying.' if flying?
    raise 'Too stormy.' if Weather.stormy?
    @location.take_off(self)
    @location, @flying = nil, true
  end

  def flying?
    @flying
  end

end
