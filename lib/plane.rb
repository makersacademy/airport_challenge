class Plane
  attr_accessor :status

  def initialize(status = :air)
    @status = status
  end

  def land(airport)
    self.status = :ground
    airport.planes << self
  end
end
