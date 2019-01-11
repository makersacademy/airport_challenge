require_relative "plane"

class Airport
  attr_accessor :planes, :capacity

  DEFAULT_CAPACITY = 5

  def initialize
    @planes = []
    @weather = (rand(3) == 2 ? :stormy : :clear)
    @capacity = DEFAULT_CAPACITY
  end

  def verify_takeoff(plane)
    !planes.include?(plane)
  end

  def permission_depart?
    @weather == :clear
  end

  def permission_land?
    planes.length < capacity && @weather == :clear
  end
end
