require 'airport'

class Plane
  attr_reader :landed, :airport

  def initialize(airport)
    @airport = airport
  end

  def land(airport)
    @airport = airport
    check_landing_exceptions
    @landed = true
  end

  def take_off(current_airport)
    check_take_off_exceptions(current_airport)
    @landed = false
    true
  end

  def landed?
    landed
  end

  private
  attr_writer :landed, :airport

  def check_take_off_exceptions(current_airport)
    fail "Can't take off from another airport" if airport != current_airport
    fail "Can't take off in stormy weather" if airport.weather == "stormy"
  end

  def check_landing_exceptions
    fail "Can't land again" if landed
    fail "Can't land in stormy weather" if airport.weather == "stormy"
    fail "Can't land in full airport" if airport.full?
  end

end
