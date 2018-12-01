require_relative 'plane'

class Airport

  attr_reader :plane

  def land(plane)
    @plane = plane
  end

  def release_plane
    print "#{@plane} departed"
  end

end
