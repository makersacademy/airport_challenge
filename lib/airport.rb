require_relative 'plane'

class Airport
  attr_reader :hanger

  def initialize
    @hanger = []
  end

  def land_plane(plane)
    @hanger << plane
  end

end
