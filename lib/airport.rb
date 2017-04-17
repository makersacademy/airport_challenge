require_relative 'plane'

class Airport
  attr_reader :plane

  def initialize
    @plane = plane
  end

  def release_plane
    Plane.new
  end

  def land(plane)
    @plane = plane
  end
  def landed?
    if plane == nil?
      'plane has not landed'
    else
      'Plane has landed'
    end
  end
end
