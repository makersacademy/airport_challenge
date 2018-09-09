require_relative './plane.rb'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :plane_list, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane_list = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail("Plane is already in airport") if plane_in_airport?(plane)
    if stormy? && plane_list.length == capacity
      "Sorry, it's too stormy and this airport is full"
    elsif stormy?
      "Sorry, it's too stormy"
    elsif plane_list.length == capacity
      "Sorry, this airport is full"
    else
      plane_list << plane
    end
  end

  def take_off(plane)
    fail("Plane is not airport") if plane_in_airport?(plane) == false
    if stormy?
      "Sorry, it's too stormy"
    else
      plane_list.delete(plane)
    end
  end

  def stormy?
    rand(7) == 6
  end

  def plane_in_airport?(plane)
    plane_list.include?(plane)
  end

end
