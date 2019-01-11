# could force initiating with valid airport object.

class Plane
  attr_reader :status , :current_airport

  def initialize(status = 'grounded', current_airport = nil)
    fail("can't be in airport if airborne") if status == 'airborne' && !current_airport.nil?
    current_airport.plane_entering_on_ground(self) if status == 'grounded'
    @status, @current_airport = status, current_airport
    self
  end

  def take_off
    can_take_off?
    @current_airport.plane_taking_off(self)
    @status, @current_airport = 'airborne', nil
    self
  end

  def land(airport)
    can_land?
    airport.plane_landing(self)
    @status, @current_airport = "grounded", airport
    self
  end

  private

  def can_land?
    fail("plane is already grounded") if @status == 'grounded'
  end

  def can_take_off?
    fail("plane is already airborne") if @status == 'airborne'
  end
end
