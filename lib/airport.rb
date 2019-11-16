class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    fail "The weather is stormy" if weather.stormy?
    fail "The airport is full" if full?

    @planes.push(plane).last
  end

  def take_off(plane)
    fail "The weather is stormy" if weather.stormy?
    fail "The airport is empty" if empty?
    fail "Plane not landed in this airport" unless @planes.include?(plane)

    @planes.delete(plane)
  end

  private

  attr_reader :planes, :weather

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end

end
