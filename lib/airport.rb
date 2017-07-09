require_relative 'plane' #i had to look this up via google

class Airport
  attr_reader 'planes'

  def initialize
    @planes = []
    @capacity = 100

  end

  def land_plane(plane)
    @planes = plane

  end

  def landed(plane)
    raise "no more planes." if @planes.length == @capacity
    @planes << plane

  end

  def takeoff(plane)
    raise "no more planes." if @planes.empty?
    @planes.pop

  end

end
