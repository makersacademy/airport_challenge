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
    fail "Plane already landed" if plane.landed?

    plane.land
    @planes.push(plane)
    plane
  end

  def take_off(plane)
    fail "The weather is stormy" if weather.stormy?
    fail "The airport is empty" if empty?
    fail "Plane not landed in this airport" unless landed_here?(plane)

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

  def landed_here?(plane)
    @planes.include?(plane)
  end

end
