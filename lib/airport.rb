require 'plane'

class Airport

  def initialize
    @planes_in_hanger = []
  end

  def planes_available
   @no_of_planes = @planes_in_hanger.length
  end

  def land_plane(plane)
    # add a plane to the hanger
    @planes_in_hanger << plane  
    @no_of_planes
  end

  def plane_takeoff(plane)
    # remove a plane from hanger
    @planes_in_hanger.pop
    puts "Plane has Taken off"
    @no_of_planes
  end

end
