require_relative "plane"

class Airport
  DEF_CAPACITY = 20

  def initialize(capacity = DEF_CAPACITY)
    @capacity = capacity
    @planes = []
    @fly = []
  end

  def land(plane)
    raise "This airport is full." if full?

    raise "Too stormy to land." if stormy?

    @planes << plane
  end

  def takeoff(plane)
    raise "Too stormy for takeoff." if stormy?

    raise "Plane in air." if flying?(plane)

    raise "Plane not in airport." if absent?(plane)

    @fly << plane
    @planes.delete(plane)
  end

  attr_accessor :planes, :stormy
  attr_reader :capacity, :fly

  private
  def full?
    @planes.length == @capacity
  end

  def stormy?
    rand(100) == 1
  end

  def absent?(plane)
    !@planes.include?(plane)
  end

  def flying?(plane)
    @fly.include?(plane)
  end
end
