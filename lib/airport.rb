class Airport

attr_reader :capacity
attr_accessor :flying

  def initialize
    @airport_planes = []
    @capacity = 20
    @flying
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail 'The plane is already in the airport' if flying == true
    @airport_planes << plane
    flying = false
  end

  def list_of_planes
    return @airport_planes
  end

  def take_off(plane)
    #----- this was my attempt at stormy weather test -----
    #fail 'Weather is stormy' if weather == "stormy"
    @airport_planes.pop
    flying = true
  end
end

  def full?
    @airport_planes.count >= capacity
  end

  #----- this was my attempt at stormy weather test -----
  #def weather
    #return "stormy"
  #end
