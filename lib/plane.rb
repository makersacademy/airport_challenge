class Plane
  FLYING = "Flying"
  LANDED = "Landed"

  def initialize
    @status = ""
    @airport
  end

  def get_status
    @status
  end

  def land
    status = LANDED
  end

  def take_off
    status = FLYING
  end

end
