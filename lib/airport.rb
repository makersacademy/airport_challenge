class Airport

  attr_reader :show_planes, :weather, :capacity

DEFAULT_CAPACITY = 4

  def initialize(capacity=DEFAULT_CAPACITY)
    @show_planes = []
    @capacity = capacity
  end

  def land(plane)
    @show_planes.length < capacity ? @show_planes.push(plane) : "There's no more space on the runway"
  end

  def plane_takeoff
      show_planes.pop()
  end

  def weather
  end

end
