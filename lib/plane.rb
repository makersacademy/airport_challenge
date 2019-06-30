class Plane
  attr_accessor :status

  def initialize(status = "Flying")
    @status = status
  end

  def land_at(airport)
    airport.land_plane(self)
    status = "Landed"
  end

  def take_off_from(airport)
    airport.take_off_plane(self)
    @status = "Flying"
  end

end
