# require 'plane'

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
    @planes_in_hanger.length
  end

  def plane_takeoff(plane)
    # remove a plane from hanger
    @planes_in_hanger.delete(plane)
    puts " #{plane} has Taken off"
    @planes_in_hanger.length
  end

end
