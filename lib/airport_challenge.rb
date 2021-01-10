require_relative "plane"

class Airport
  DEF_CAPACITY = 20

  def initialize(capacity = DEF_CAPACITY)
    @capacity = capacity
    @planes = []
    @fly = []
  end

  def land(plane)
    landing_safety_check
    @planes << plane
  end

  def landing_safety_check
    raise "This airport is full." if full?

    raise "Too stormy to land." if stormy?
  end

  def takeoff(plane)
    takeoff_safety_check(plane)
    @fly << plane
    @planes.delete(plane)
  end

  def takeoff_safety_check(plane)
    raise "Too stormy for takeoff." if stormy?

    raise "Plane in air." if flying?(plane)

    raise "Plane not in airport." if absent?(plane)
  end

  attr_accessor :planes
  attr_reader :capacity, :fly, :stormy

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
