require_relative 'plane'

class Airport

  attr_accessor :capacity

  def initialize
    @capacity = 20
    @planes = []
  end

  def receive_plane plane
    fail 'Airport is full' if full?
    plane.land
    @planes << plane
  end
  # how does this mesh with the land method
  # in the plane file?

  def release_plane plane
  end


  def full?
    @planes.count >= capacity
  end


end

# MAKE IT SO THAT THE PLANE CAN'T LAND OR 
# TAKE OFF UNLESS THE AIRPORT RECEIVES OR
# RELEASES IT.