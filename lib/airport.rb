class Airport
  DEFAULT_CAPACITY = 4
  attr_reader :capacity
  attr_reader :planes_in_port

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_in_port = []
  end

  def capacity_status
    available = @capacity - @planes_in_port.size
    available <= 0 ? "full" : "there are spaces to land in"
  end
end
