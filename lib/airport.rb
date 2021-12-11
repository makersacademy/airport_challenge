class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def confirm_takeoff
  end

  def full?
    @planes.size >= capacity
  end

  def land(plane)
    raise 'No clearance to land: Airport is full' if full?
    @planes << plane
  end
end