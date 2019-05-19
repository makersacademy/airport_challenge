class Airport

  attr_reader :show_planes, :weather, :capacity

  DEFAULT_CAPACITY = 4

  def initialize(capacity = DEFAULT_CAPACITY)
    @show_planes = []
    @capacity = capacity
  end

  def land(plane)
    @show_planes.length < capacity ? @show_planes.push(plane) : "No more space"
  end

  def plane_takeoff
    show_planes.pop()
  end

end
