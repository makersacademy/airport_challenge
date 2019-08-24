require_relative 'airport'

class Plane

  attr_accessor :passengers

  def initialize
    @passengers = []
  end

  def land(airport)
    return "Cannot land due to poor weather" if airport.stormy

    airport.planes << self
  end

  def take_off(airport)
    return "Cannot take off due to stormy weather" if airport.stormy

    airport.planes.delete(self)
    check_departure(airport)
  end

  def check_departure(airport)
    return "#{self} has failed to depart" if airport.planes.include?(self)

    "#{self} has successfully departed"
  end
end
