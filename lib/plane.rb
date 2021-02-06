class Plane
  attr_accessor :status

  def initialize(status = :air)
    @status = status
  end

  def land(airport)
    airport.request_landing
    airport.planes << self
    update_status(:ground)
  end

  def take_off(airport)
    airport.request_take_off(self)
    airport.planes.delete(self)
    update_status(:air)
  end

  private

  def update_status(status)
    self.status = status
  end
end
