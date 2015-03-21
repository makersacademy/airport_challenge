class AirTrafficControl
  attr_accessor :airport, :plane
  def land_plane
    @airport.land_plane
  end

  def land
    fail 'cannot land' unless @plane.flying
    @plane.land
  end
end
