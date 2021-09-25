class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 50
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off
    raise "No Planes" if no_planes?
    @planes.pop
  end

  def land(plane)
    raise "Airport Full" if at_max_capacity?
    @planes << plane
  end

  private

  def no_planes?
    @planes.empty?
  end

  def at_max_capacity?
    @planes.length == @capacity
  end
end