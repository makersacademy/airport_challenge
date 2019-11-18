require_relative 'airport'

class Plane
  attr_reader :status, :location

  def initialize(status = 'grounded', *location)
    @status = status
    status == 'grounded' ? @location = location : @location = 'Not at airport'
  end

  def land(airport)
    fail 'Can\'t land when plane is already grounded' if @status == 'grounded'

    fail 'WARNING stormy weather at airport abort landing' if airport.stormy == true

    fail "WARNING airport is full, no space to land" if airport.planes.count == airport.capacity

    airport.planes << self
    'Plane has landed safely!'
  end

  def take_off(airport)
    fail "Can't take off when the plane is already flying" if @status == 'flying'

    fail 'WARNING too stormy to take off, abort take off' if airport.stormy == true

    @location = 'Not at airport'
    'Plane has taken off safely!'
  end
end
