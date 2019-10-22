require_relative 'airport'

class Plane

  attr_reader :grounded
  def initialize
    @grounded = false
  end

  def land(airport)
    return 'Too stormy to land' if airport.stormy
    return 'Airport is full' if airport.full?
    return 'Plane already landed' if @grounded

    airport.planes << self
    @grounded = true if grounded_in?(airport)
  end

  def take_off(airport)
    return 'Too stormy to take off' if airport.stormy
    return "#{self} is either in the air or not in this airport" unless grounded_in?(airport)

    airport.planes.delete(self)
    airport.confirm_departure(self)
    @grounded = false
  end

  def grounded_in?(airport)
    airport.planes.include?(self)
  end
end
