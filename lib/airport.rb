require_relative 'plane'
require_relative 'runway'

class Airport

  include Runway
  include Weather

  def land(plane)
    if plane_is_already_landed?(plane)
      nil
    elsif runway_at_capacity?
      "We're too full - go land somewhere else!"
    else
      fail "Storm! Do not land here!" if it_is_stormy?
      add_plane_to_runway(plane)
    end
  end

  def take_off(plane)
    unless plane_is_already_landed?(plane)
      nil
    else
      fail "Storm! Do not take off!" if it_is_stormy?
      remove_plane_from_runway(plane)
    end
  end

  private

  def remove_plane_from_runway(plane)
    runway_traffic.delete(plane)
  end

  def add_plane_to_runway(plane)
    runway_traffic << plane
  end

  def it_is_stormy?
    stormy? == true
  end

  def runway_at_capacity?
    runway_traffic.count >= runway_capacity
  end

end
