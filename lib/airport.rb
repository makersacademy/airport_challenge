require_relative 'plane'


class Airport

  attr_reader :plane

  def land_plane(plane)
    true
    #@plane = plane
  end

  def landed?(plane)
    true
  end



end
