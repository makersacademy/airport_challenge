require_relative 'plane'

class Airport
  attr_accessor :hanger

  def initialize
    @hanger = []
  end

  def land_plane(plane)
    @hanger << plane
  end

  def takeoff_plane(plane)
    @hanger.delete(plane)
  end

end
