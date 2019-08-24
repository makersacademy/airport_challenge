require_relative 'airport'

class Plane

  attr_accessor :passengers

  def initialize
    @passengers = []
  end

  def land(airport)
    airport.planes << self
  end

  def take_off(airport)
    airport.planes.delete(self)
    "#{self} has successfully departed" unless airport.planes.include?(self)
  end
end
