require_relative 'plane' #i had to look this up via google

class Airport
  attr_reader :plane

  def land_plane(plane) #rspec found wrong number of arguments: sorted
    @plane = plane

  end

  def landed(plane)
    raise "plane has departed, no more planes." if @plane
    @plane = plane

  end

  def takeoff(plane)
    raise "no more planes." unless @plane
    @plane

  end

end
