class Plane

  attr_reader :status, :airport_at

  def land(airport)
    @status = :on_the_ground
    @airport_at = airport
  end

  def take_off(airport)
    message =  "Can't take off from an airport the plane isn't at."
    raise message if self.airport_at != airport
    @status = :in_the_air
  end



end
