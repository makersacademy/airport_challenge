require_relative 'airport'

class Plane

  def initialize
    @docked_at = nil
  end

  def land(airport)
    landing_check
    airport.landing(self)
    @docked_at = airport
  end

  def takeoff(airport)
    takeoff_check(airport)
    airport.depart(self)
    @docked_at = nil
  end

private

  def takeoff_check(airport)
    fail "Plane not docked at #{airport}" if @docked_at != airport
  end

  def landing_check
    fail "Plane already docked at #{@docked_at}" if @docked_at.nil? == false
  end

end
