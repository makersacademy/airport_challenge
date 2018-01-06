require_relative 'airport'

class Plane
  attr_reader :airport

  def initialize
    @airport = nil
  end

  def land(target_airport)
    raise 'Plane is already landed' if is_landed?
    target_airport.planes.push(self)
    @airport = target_airport
  end

  def take_off
    raise 'Plane is already airborne' unless is_landed?
    @airport.planes.delete(self)
    @airport = nil
  end

  def is_landed?
    @airport.is_a?(Airport)
  end
end
