# returns its status, can be instructed to land & take off, sends requests to air traffic control
class Plane
  attr_reader :status

  def land(airport)
    landing_guard
    airport.request_landing(self) # see AirTrafficControl
    update_status(:ground)
  end

  def take_off(airport)
    take_off_guard
    airport.request_take_off(self) # see AirTrafficControl
    update_status(:air)
  end

  private

  attr_writer :status

  def initialize
    @status = :air
  end

  def landing_guard
    raise LandingError if grounded?
  end

  def take_off_guard
    raise TakeOffError unless grounded?
  end

  def grounded?
    status == :ground
  end

  def update_status(status)
    self.status = status
  end
end
