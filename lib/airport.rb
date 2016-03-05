
class Airport
  attr_reader :planes, :capacity
  def initialize
    @planes = []
    @capacity = 20
  end

  def full?
     planes.length == capacity ? true : false
  end
  # def land_plane(plane)
  #   planes << plane
  # end
end
