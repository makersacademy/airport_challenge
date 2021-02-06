require_relative './plane.rb'

class Airport
  attr_reader :plane
  def new_plane
    Plane.new
  end

  def land(plane)
    @plane = plane
  end
end
