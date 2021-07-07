class Plane
  attr_reader :status
  attr_reader :airport

  FLYING = "Flying"
  LANDED = "Landed"

  def initialize
    @status = ""
    @airport = ""
  end

  def land(airport_name)
    raise "Plane can't land, it's already on the ground" if @status == LANDED

    @airport = airport_name
    @status = LANDED
  end

  def take_off(airport)
    raise "Plane can't take off, it's at another airport" if @airport != airport

    raise "Plane can't take off, it's already flying" if @status == FLYING

    @status = FLYING
  end
end
