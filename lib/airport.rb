require_relative 'plane'

class Airport
  attr_accessor :landed
  def initialize
    @landed = []
  end

  def create_plane
    Plane.new
  end

  def land(plane)
    @landed << plane
  end
  
  def landed?(plane)
    if @landed.include? plane
        true
    else false
    end
  end
end
