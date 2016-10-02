require_relative "plane.rb"

class Airport
    DEFAULT_CAPACITY = 50
    attr_reader :planes, :capacity, :stormy

  def initalize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @stormy = []
  end

  def land(plane)
    raise "There is no room to land!" if full?
    @planes << plane
      "Confirm the plane has landed"
  end

  def take_off(plane)
    @planes.pop
  end

  private
  def full?
    @planes.count == @capacity
  end
end
