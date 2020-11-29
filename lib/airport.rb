require './lib/plane.rb'

class Airport

  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def land_plane(plane)
    @hangar << plane
    plane.current_location = 'landed'
  end

  def take_off(plane)
    @hangar.delete(plane)
    plane.current_location = 'flying'
  end
end
