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
    # Returns true if plane not at airport and false if plane at airport
    !planes.include?(plane)
  end

  def permission?
    # Returns true if weather is good and false otherwise
    @weather == :clear
  end

  def landing_permission?
    planes.length < capacity && @weather == :clear
  end
end
