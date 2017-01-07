
require_relative 'plane'

class Airport

attr_reader :landing_bay

  def initialize()
    @landing_bay = []
  end

  def land_plane(plane)
    plane = plane
    plane.change_status("Landed")
    @landing_bay << plane
    
  end


end
