require 'plane.rb'

class Airport

  attr_reader :hangar

  def land(plane)
    @hangar = plane
  end

  def take_off(plane)
    plane
  end
end
