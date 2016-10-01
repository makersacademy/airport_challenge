require_relative 'plane'

class Airport

attr_reader :plane
attr_accessor :grounded_planes

  def initialize
    @grounded_planes = []
  end

  def land(plane)
    plane.flying = false
    plane.status = 'landed'
    puts "Plane has landed"
    @grounded_planes << plane
  end

end
