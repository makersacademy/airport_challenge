class Plane

  attr_reader :landed

  def land(airport, weather = Weather.new)
    raise 'Cannot land, adverse weather conditions' if weather.stormy == true
    raise 'Cannot land, airport is full' if airport.plane
    @landed = true
    airport.port_plane(self)
  end

  def take_off(airport, weather = Weather.new)
    raise 'Cannot take off, adverse weather conditions' if weather.stormy == true
    @landed = false
    airport.release_plane
  end

end
