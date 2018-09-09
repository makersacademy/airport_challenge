require_relative './plane.rb'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :plane_list, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane_list = []
    @capacity = capacity
  end

  def land_plane(plane)
    if stormy? == 6 && plane_list.length == 10
      "Sorry, it's too stormy and this airport is full"
    elsif stormy? == 6
      "Sorry, it's too stormy"
    elsif plane_list.length == 10
      "Sorry, this airport is full"
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
