require_relative 'plane'

class Airport

  attr_reader :plane

  def land_plane
    fail 'The airport is full' unless @plane
    @plane
  end

  def take_off(plane)
    @plane = plane
  end

end
