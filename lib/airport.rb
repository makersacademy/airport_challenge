class Airport
  DEFAULT_CAPACITY = 4
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def capacity_status
    planes_in_port = []
    available = @capacity - planes_in_port.size
    available <= 0 ? "full" : "there are spaces to land in"
  end
end
