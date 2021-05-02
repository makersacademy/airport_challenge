class Airport
  DEFAULT_CAPACITY = 4
  attr_reader :capacity
  attr_reader :planes_in_port
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_in_port = []
  end

  def capacity_status
    available = @capacity - plane_count
    available <= 0 ? "full" : "there are spaces to land in"
  end

  def plane_arrives(plane)
    @planes_in_port << plane.to_s
    return
  end

  def plane_departs
    @planes_in_port.pop
    return
  end

  def plane_count
    @planes_in_port.size
  end
end
