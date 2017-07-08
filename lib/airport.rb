require 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    fail 'This plane has already landed' if plane.status == :landed
    @planes << plane
    plane.landed
    puts "#{plane} has landed"
  end

  def take_off(plane)
    fail 'This plane is already flying' if plane.status == :flying
    @planes.delete(plane)
    plane.flying
    puts "#{plane} has taken off"
  end
end
