class Airport

attr_reader :capasity

  def initialize
    @airport_planes = []
    @capasity = 20
  end

  def land(plane)
    fail 'Airport is full' if airport_full
    @airport_planes << plane
  end

  def list_of_planes
    return @airport_planes
  end

  def take_off(plane)
    @airport_planes.pop
  end
end

  def airport_full
    @airport_planes.count >= capasity
  end

class Plane

end
