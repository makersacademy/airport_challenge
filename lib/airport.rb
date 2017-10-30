class Airport
  attr_reader :planes, :weather, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    fail "plane already in airport" if present?(plane)
    fail "the weather is stormy" if weather.stormy?
    fail "the airport is full" if at_capacity?
    @planes << plane
  end

  def take_off(plane)
    fail "plane not in airport" unless present?(plane)
    fail "the weather is stormy" if weather.stormy?
    @planes.delete(plane)
  end

  private

  def present?(plane)
    @planes.include?(plane)
  end

  def at_capacity?
    @planes.length >= @capacity
  end

end
