# can be instructed to land and take off, sends requests to air traffic control
class Plane

  def land(airport)
    landing_guard
    airport.request_landing(self)
    update_status(:ground)
  end

  def take_off(airport)
    take_off_guard
    airport.request_take_off(self)
    update_status(:air)
  end

  private

  attr_accessor :status

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
