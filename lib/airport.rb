class Airport
  DEFAULT_CAPACITY = 4
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_in_port = []
  end

  def capacity_status
    available = @capacity - @planes_in_port.size
    available <= 0 ? "full" : "there are spaces to land in"
  end

  def plane_arrives(plane)
    @planes_in_port << plane.to_s
    return
  end

  def plane_count
    @planes_in_port.size
  end
end
