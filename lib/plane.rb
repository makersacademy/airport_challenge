require_relative 'airport'

class Plane

  def initialize
    @plane_stored = nil
  end

  def land(airport)
    fail "Plane already stored at #{@plane_stored}" if check_landed == false

    airport.landing(self)
    @plane_stored = airport
  end

  def take_off(airport)
    fail "Plane not docked at #{airport}" if check_takeoff(airport)

    airport.depart(self)
    @plane_stored = ""
  end

private

  def check_takeoff(airport)
    @plane_stored != airport
  end

  def check_landed
    @plane_stored.nil?
  end

end
