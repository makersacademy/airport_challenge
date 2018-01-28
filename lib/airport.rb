require_relative "plane.rb"

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :hangar, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land, airport full" if full?
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
    puts "Plane #{plane} has left the hangar"
  end

#TODO - make a module witht these core functionalities
  private

    def full?
      @hangar.count >= @capacity
    end

end
