# can be instructed to land and take off, sends requests to air traffic control
class Plane
  attr_accessor :status

  def initialize(status = :air)
    @status = status
  end

  def land(airport)
    landing_guard
    airport.request_landing
    enter(airport) # refactor into air traffic control as #clear_for_landing
    update_status(:ground)
  end

  def take_off(airport)
    take_off_guard
    airport.request_take_off(self)
    leave(airport) # refactor into air traffic control as #clear_for_take_off
    update_status(:air)
  end

  private

  def update_status(status)
    self.status = status
  end

  def enter(airport)
    airport.planes << self
  end

  def leave(airport)
    airport.planes.delete(self)
  end

  def grounded?
    status == :ground
  end

  def landing_guard
    raise LandingError if grounded?
  end

  def take_off_guard
    raise TakeOffError unless grounded?
  end
end
