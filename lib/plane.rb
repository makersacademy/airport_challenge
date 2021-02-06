class Plane
  attr_accessor :status

  def initialize(status = :air)
    @status = status
  end

  def land(airport)
    self.status = :ground
    airport.planes << self
  end

  def take_off(airport)
    self.status = :air
    airport.planes.delete(self)
  end
end
