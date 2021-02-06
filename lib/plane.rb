class Plane
  attr_accessor :status, :airport

  def initialize(status = :air)
    @status = status
    @airport = nil
  end

  def land(airport)
    airport.planes << self
    self.airport = airport
    self.status = :ground
  end

  def take_off
    airport.planes.delete(self)
    self.airport = nil
    self.status = :air
  end
end
