require './lib/airplane.rb'



class Airport

attr_reader :landed_planes
  def initialize
    @landed_planes = []
  end

  def land_plane(plane)
    @landed_planes << plane
    #print "The plane has landed."
    print_confirm
  end

  def print_confirm
    "The plane has landed"
  end
end
