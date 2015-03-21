class AirTrafficControl
  attr_accessor :airport, :plane
  def land_plane
    fail 'airport at capcity' unless @airport.num_planes < @airport.capcity
    @airport.land_plane
  end

  def land
    fail 'cannot land' unless @plane.flying
    @plane.land
  end

  def weather
  end
end
