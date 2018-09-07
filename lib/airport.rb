require_relative './plane.rb'

class Airport

  attr_reader :plane_list

  def initialize
    @plane_list = []
  end

  def land_plane(plane)
    plane_list << plane
  end

  def take_off(plane)
    plane_list.delete(plane) 
  end

end
