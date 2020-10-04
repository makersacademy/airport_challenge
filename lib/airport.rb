class Airport

  attr_reader :plane
  attr_reader :capacity
  attr_reader :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "The airport is full!" if @planes.count == @capacity

    @planes << plane
  end

  def take_off
    Plane.new
  end

end
