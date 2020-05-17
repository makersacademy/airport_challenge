class Airport

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY, weather = rand(5))
    @planes = []
    @capacity = capacity
    @weather = weather

  end

  def land(plane)
    fail "Airport full" if full

    @planes << plane
  end

  def take_off(plane)
    fail "Airport empty" if empty?

    @planes.delete(plane)
    puts "#{plane} has taken off"
    self
  end

  def storms
    fail "No take off storms" if rndstorm

  end

  def full
    @planes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.length <= 0
  end

  def rndstorm
    @weather.odd?
  end
end
