class Plane

  attr_reader :landed

  def land(airport, stormy = Weather.stormy?)
    raise 'Cannot land. Plane is already grounded' if @landed == true
    raise 'Cannot land, airport is full' if airport.planes.length == airport.capacity
    raise 'Cannot land, adverse weather conditions' if stormy == true
    @landed = true
    airport.port_plane(self)
  end

  def take_off(airport, stormy = Weather.stormy?)
    raise 'Cannot take off. Plane is already in the air' if @landed == false
    raise 'Cannot take off. Plane is not based at this airport' unless airport.planes.include? self
    raise 'Cannot take off, adverse weather conditions' if stormy == true
    @landed = false
    airport.release_plane(self)
  end

end
