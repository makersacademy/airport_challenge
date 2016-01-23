class Plane

  def land airport
    raise 'Plane unable to land due to bad weather conditions at target airport' unless airport.sunny?
    raise 'Plane unable to land because landing strip at target airport is full' if airport.full?
    airport.land_plane self
    @airport = airport
    'Plane has landed successfully'
  end

  def takeoff
    raise 'Plane unable to takeoff due to bad weather conditions at target airport' unless @airport.sunny?
    @airport.remove_plane self
    'Plane has taken off successfully'
  end

end
