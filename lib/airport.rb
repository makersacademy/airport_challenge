require_relative './plane.rb'

class Airport

  attr_reader :plane_list

  def initialize
    @plane_list = []
  end

  def land_plane(plane)
    if stormy? == 6
      "Sorry, it's too stormy"
    else
      plane_list << plane
    end
  end

  def take_off(plane)
    if stormy? == 6
      "Sorry, it's too stormy"
    else
      plane_list.delete(plane)
    end
  end

  def stormy?
    rand(7)
  end

end
