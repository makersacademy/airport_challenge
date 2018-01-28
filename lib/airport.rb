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
    raise "Stormy, cannot land!" if stormy?
    @hangar << plane
  end

  def take_off(plane)
    raise "Stormy, cannot take off!" if stormy?
    @hangar.delete(plane)
    puts "Plane #{plane} has left the hangar"
  end

#TODO - make a module with these core functionalities that is mixed in
  private

    def full?
      hangar.count >= capacity
    end

    def stormy?
      true if rand(10) > 8
    end

end
