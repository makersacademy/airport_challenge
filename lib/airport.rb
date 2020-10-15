require_relative 'plane.rb'
class Airport
  attr_reader :hangar

  def initialize
    @capacity = 1
    @hangar = []
  end

  def land(plane)
    fail "Airport is full" if is_full?
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
    puts "Plane: #{plane} took off"
  end

  private
  def is_full?
    @hangar.size == @capacity
  end
end
