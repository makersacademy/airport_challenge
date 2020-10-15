require_relative 'plane.rb'
class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
    puts "Plane: #{plane} took off"
  end
end
