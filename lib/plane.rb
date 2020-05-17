require_relative 'airport'

class Plane

  def initialize
    @docked_at = nil
  end

  def land(airport)
    fail "Plane already docked at #{@docked_at}" if landing_check == false

    airport.landing(self)
    @docked_at = airport
  end

  def takeoff(airport)
    fail "Plane not docked at #{airport}" if takeoff_check(airport)

    airport.depart(self)
    @docked_at = nil
  end

private

  def takeoff_check(airport)
    @docked_at != airport
  end

  def landing_check
    @docked_at.nil?
  end

end
