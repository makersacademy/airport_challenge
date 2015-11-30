class Plane

  attr_reader :status, :airport_at

  def initialize
    @status = :in_the_air
    @airport_at = :not_in_airport
  end

  def land(airport)
    message = "Can't land, already on the ground."
    fail message if already_on_the_ground?(self)
    message = 'Not clear to land'
    fail message if !airport.clear_to_land?
    airport.land(self)
    @status = :on_the_ground
    @airport_at = airport
  end

  def take_off(airport)
    message =  "Can't take off from an airport the plane isn't at."
    fail message if not_at_that_airport?(self, airport)
    message = "Can't take off, already in the air."
    fail message if already_in_the_air?(self)
    @status = :in_the_air
    @airport_at = :not_in_airport
  end

  private

  def clear_to_land?
    !airport.clear_to_land?
  end

  def already_on_the_ground?(plane)
    plane.status == :on_the_ground
  end

  def not_at_that_airport?(plane, airport)
    plane.airport_at != airport
  end

  def already_in_the_air?(plane)
    plane.status == :in_the_air
  end

end
