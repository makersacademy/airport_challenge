require_relative 'plane'

class Airport
  
  def initialize
    @airplanes = []
  end

  def land_plane(plane)
    @airplanes << plane
  end

end
