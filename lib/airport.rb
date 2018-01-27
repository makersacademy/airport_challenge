require_relative "plane.rb"

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :hangar, :capacity

  def initialize
    @hangar = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
    puts "Plane #{plane} has left the hangar"
  end

end
