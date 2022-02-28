require 'plane'

class Airport
  attr_accessor :hangar

  def initialize(capacity = 10)
    plane = Plane.new
    @hangar = [plane]
    @capacity = capacity
  end

  def land
    raise IndexError.new("the hangar is full") if full?
    hangar.push(plane)
  end

  def takeoff
    raise IndexError.new("the hangar is empty") if empty?
    @hangar.pop(plane)
  end

  def full?
    @hangar.length >= @capacity
  end

  def empty?
    @hangar.length == 0
  end

end
 