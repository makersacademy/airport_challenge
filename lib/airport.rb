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
    #----- this was my attempt at stormy weather test -----
    #fail 'Weather is stormy' if weather == "stormy"
    @airport_planes.pop
  end
end

  def airport_full
    @airport_planes.count >= capasity
  end

  #----- this was my attempt at stormy weather test -----
  #def weather
    #return "stormy"
  #end

class Plane

end
