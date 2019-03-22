require_relative 'plane'

class Airport
  attr_reader :plane

  def landing_plane
  end

  def airport_capacity(plane)
    fail 'Airport is full' if @plane
    @plane = plane
  end 

  def land(plane)
    fail 'Stormy weather, do not land!' unless @plane
    @plane = plane
  end

  def take_off(plane)
    fail 'Stormy weather, do not take off!' unless @plane
    @plane
  end
end
