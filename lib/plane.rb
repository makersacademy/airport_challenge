class Plane

  def land airport
    raise "Plane unable to land due to bad weather conditions at target airport" unless airport.sunny?
    airport.land_plane self
    @airport = airport
  end

  def takeoff
    raise "Plane unable to takeoff due to bad weather conditions at target airport" unless @airport.sunny?
    @airport.remove_plane self
  end

end
