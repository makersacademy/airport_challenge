require_relative 'plane'
require_relative 'runway'

class Airport

  include Runway

  def runway_traffic
    @@runway
  end

  def land(plane)
    add_plane_to_runway(plane) unless
    plane_is_already_landed?(plane)
  end

  def take_off(plane)
    fail "Storm! Do not take off!" if it_is_stormy?
    remove_plane_from_runway(plane)
  end

  private

  def remove_plane_from_runway(plane)
    @@runway.delete(plane)
  end

  def add_plane_to_runway(plane)
    @@runway << plane
  end

  def plane_is_already_landed?(plane)
    @@runway.include?(plane)
  end

  def it_is_stormy?
    stormy? == true
  end

end
