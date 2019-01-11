require_relative 'airport'

class Plane
  def land(airport)
    airport.planes << self
  end

  def take_off(airport)
    airport.planes.include?(self) ? airport.planes.delete(self) : (raise 'This plane is not at this airport')
    "#{self} has now left #{airport}"
  end
end
