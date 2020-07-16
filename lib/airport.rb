require "plane"
class Airport
  MAX_CAPACITY = 10

  def initialize
    @planes = []
  end

  def land(plane)
    fail if full?
    @planes << plane
    return true
  end
  def take_off(plane)
    puts "Plane has taken off"
  end

  private
  def full?
    @planes.count >= MAX_CAPACITY
  end

end
