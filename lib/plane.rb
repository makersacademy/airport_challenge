class Plane
  FLYING = "Flying"
  LANDED = "Landed"

  def initialize
    @status = ""
    @airport = ""
  end

  def get_status
    @status
  end

  def get_airport
    @airport
  end

  def land(airport_name)
    raise "Plane can't land, it's already on the ground" if @status == LANDED
    @airport = airport_name
    @status = LANDED
  end

  def take_off(airport_name)
    raise "Plane can't take off, it's at another airport" if @airport != airport_name
    raise "Plane can't take off, it's already flying" if @status == FLYING
    @status = FLYING
  end

end
