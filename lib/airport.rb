require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
#puts "#{plane} has landed"
    @planes << plane
    return @planes
  end

  def take_off
  plane =  @planes.pop
   return plane

  end


end
