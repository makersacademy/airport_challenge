require_relative 'airport'

class Plane

  attr_reader :flight_approval, :land_approval, :airport

  def initialize(airport)
    @airport, @flight_approval = airport, false
    @airport.dock_plane(self)
  end

  def take_off
    take_off_check
    @airport.release_plane(self)
    @land_approval, @airport = false, :inflight
  end

  def land(airport)
    landing_check(airport)
    @flight_approval, @airport = false, airport
    @airport.dock_plane(self)
  end

  def acknowledge_flight_approval
    @flight_approval = true
  end

  def acknowledge_land_approval(airport)
    @land_approval_at = airport
  end

  def take_off_check
    fail 'no flight approval' if @flight_approval == false
  end

  def landing_check(airport)
    fail 'you are already landed' if @airport != :inflight
    fail 'not approved to land here' if @land_approval_at != airport
    fail 'airport not specified' if airport.class != Airport
  end

end
