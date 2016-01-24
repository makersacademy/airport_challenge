require './lib/Plane.rb'

class Airport
  attr_accessor :grounded_planes

  def initialize
    @grounded_planes = []
  end

  def landed(plane)
    @grounded_planes << plane
  end

  def flying(plane)
    @grounded_planes.delete plane
  end
end
