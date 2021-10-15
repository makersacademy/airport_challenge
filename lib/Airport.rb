require './lib/plane.rb'

class Airport

attr_accessor :DEFAULT_CAPACITY
attr_reader :plane
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @parked_planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def depart_plane(plane)
    raise "Plane has left"
  end

  def land_plane(plane)
    raise "No bays available" if full?
    @parked_planes << plane
  end

  def full?
    if @parked_planes.count >= DEFAULT_CAPACITY
      return true
    else
     return false
    end
  end

end 