class Airport
  DEFAULT_CAPACITY = 20
  DEFAULT_WEATHER = [:sunny, :cloudy, :rainy, :stormy].sample
  attr_reader :planes, :capacity, :weather

  def initialize(capacity=DEFAULT_CAPACITY, weather=DEFAULT_WEATHER)
    @planes =[]
    @capacity = capacity
    @weather = weather
  end

  def takeoff
    fail "Plane not allowed to take off due to the stormy weather." if stormy?
    planes.pop
  end

  def land(plane)
    fail "Airport is full. Not allowed to land." if full?
    fail "Plane NOT allowed to land due to the stormy weather." if stormy?
    planes << plane
  end

  def stormy?
    true if weather == :stormy
  end

  private

  def full?
    true if planes.count >= capacity
  end


end
