require './lib/airplane.rb'



class Airport

attr_reader :landed_planes
  def initialize
    @landed_planes = []
  end

  def land_plane(plane)
    @landed_planes << plane
    #print "The plane has landed."
    print_landing
  end

  def takeoff
    @landed_planes.pop
    print_takeoff
  end

  def print_landing
    "The plane has landed"
  end

  def print_takeoff
    "The plane has left"
  end
end
