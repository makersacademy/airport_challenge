require_relative 'airport'

class Plane

  attr_accessor :passengers
  attr_reader :landed

  def initialize
    @passengers = []
    @landed = false
  end

  def land(airport)
    return "Cannot land due to poor weather" if airport.stormy
    return "#{self} not currently in the air" if @landed
    return "no space to land" if airport.full?

    airport.planes << self
    @landed = true if parked_in?(airport)
  end

  def take_off(airport)
    return "Cannot take off due to stormy weather" if airport.stormy
    return "#{self} not at this airport" unless parked_in?(airport)

    airport.planes.delete(self)
    airport.confirm_departure(self)
    @landed = false
  end

  def parked_in?(airport)
    airport.planes.include?(self)
  end
end
