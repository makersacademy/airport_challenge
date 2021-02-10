# returns flight status, lands, takes off, sends requests to air traffic control
class Plane
  attr_reader :status

  def land(airport)
    raise LandingError if grounded?
    airport.request_landing(self) # defined in AirTrafficControl
    self.status = :ground
  end

  def take_off(airport)
    raise TakeOffError unless grounded?
    airport.request_take_off(self) # defined in AirTrafficControl
    self.status = :air
  end

  private

  attr_writer :status

  def initialize
    @status = :air
  end

  def grounded?
    status == :ground
  end
end
