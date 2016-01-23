class Plane

  message = 'Plane cannot complete action: '

  def land airport
    fail message + 'bad weather' unless airport.sunny?
    fail message + 'landing strip full' if airport.full?
    airport.land_plane self
    @airport = airport
    'Plane has landed successfully'
  end

  def takeoff
    fail message + 'bad weather' unless @airport.sunny?
    @airport.remove_plane self
    'Plane has taken off successfully'
  end

end
