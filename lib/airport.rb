require './lib/plane.rb'

class Airport

  attr_accessor :hangar, :capacity

  def initialize
    @hangar = []
    @capacity = 1
  end

  def land_plane(plane)
    fail 'hangar full' unless capacity?

    @hangar << plane
    plane.current_location = 'landed'
  end

  def take_off(plane)
    @hangar.delete(plane)
    plane.current_location = 'flying'
  end

  def plane_present?(plane)
    @hangar.include?(plane)
  end

  def capacity?
    @hangar.count < @capacity
  end
end
