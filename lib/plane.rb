class Plane

  attr_reader :flying, :airport_at

  def initialize
    @flying = true
    @airport_at = :not_in_airport
  end

  def land(airport)
    message = "Can't land, already on the ground."
    fail message if !flying?
    message = 'Not clear to land'
    fail message if !airport.clear_to_land?
    airport.land(self)
    @flying = false
    @airport_at = airport
  end

  def take_off(airport)
    message =  "Can't take off from an airport the plane isn't at."
    fail message if not_at_that_airport?(self, airport)
    message = "Can't take off, already in the air."
    fail message if flying?
    @flying = true
    @airport_at = :not_in_airport
  end



  def flying?
    @flying
  end

  private

  def clear_to_land?
    !airport.clear_to_land?
  end


  def not_at_that_airport?(plane, airport)
    plane.airport_at != airport
  end



end
