require_relative 'weather'

class Airport

  attr_reader :planes, :capacity, :weather

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    # @weather = weather`
  end

  def land(plane)
    fail "Airport is full" if full?
    fail "Too stormy to land" if stormy?
    planes << plane
  end

  def take_off(plane)
    fail "Airport is empty" if empty?
    fail "Too stormy to take off" if stormy?
    planes.pop
    return "Plane take off"
  end

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end

  def stormy?
    weather = Weather.new
    weather.stormy?
  end


end
