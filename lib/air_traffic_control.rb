class AirTrafficControl
  attr_accessor :airport, :plane
  def land_plane
    @airport.land_plane
  end

  def land
    @plane.land
  end
end
