class Plane

  attr_reader :landed

  def land(airport, weather = Weather.new)
    raise 'Cannot land, adverse weather conditions' if weather.stormy == true
    raise 'Cannot land, airport is full' if airport.planes.length == Airport::DEFAULT_CAPACITY
    @landed = true
    airport.port_plane(self)
  end

  def take_off(airport, weather = Weather.new)
    raise "Plane is not based at this airport, cannot take off" unless airport.planes.include? self
    raise 'Cannot take off, adverse weather conditions' if weather.stormy == true
    @landed = false
    airport.release_plane(self)
  end

end
