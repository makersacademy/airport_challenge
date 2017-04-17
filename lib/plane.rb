class Plane

  def land airport
    message = 'Plane cannot complete action: '
    fail message + 'already at airport' unless @airport.nil?
    fail message + 'bad weather' unless airport.sunny?
    fail message + 'landing strip full' if airport.full?
    airport.land_plane self
    @airport = airport
    'Plane has landed successfully'
  end

  def takeoff
    message = 'Plane cannot complete action: '
    fail message + 'not currently at airport' if @airport.nil?
    fail message + 'bad weather' unless @airport.sunny?
    @airport.remove_plane self
    @airport = nil
    'Plane has taken off successfully'
  end

end
