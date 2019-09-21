class Airport
  attr_reader :planes, :weather, :capacity
  attr_writer :planes, :weather, :capacity # allows capacity to be overwritten

  def initialize
    @capacity = 10
    @planes = []
    plane1 = Plane.new
    @planes << plane1
    if rand(1..10) == 10
      @weather = "stormy"
    else
      @weather = "sunny"
    end
  end

  def land(plane)
    fail "Warning: Weather is too stormy to land" unless @weather == "sunny"
    fail "Warning: Too many planes at airport" unless planes.count.zero?

    @planes << plane
  end

  def takeoff(_plane)
    fail "Warning: Weather is too stormy to depart" unless @weather == "sunny"

    @planes.pop
    return @planes
  end
end
