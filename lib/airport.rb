require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 50

  attr_reader :capacity, :weather

  def initialize
    @airport_space = []
    @capacity = DEFAULT_CAPACITY
    @weather = "sunny"
  end

  def landing(plane)
    fail "Can't land in storm" if stormy?
    plane.land
    fail "Airport is full" if full?
    @airport_space << plane
  end

  def take_off
    fail "Can't take off in storm" if stormy?
    fail "Airport empty" if empty?
    plane = @airport_space.pop
    plane.fly
    plane
  end

  def empty?
    @airport_space.empty?
  end

  def randomize_weather(n = rand(5))
    return @weather = "sunny" if n < 3
    @weather = "stormy"
  end

  private

  def stormy?
    @weather == "stormy"
  end

  def full?
    @airport_space.length >= DEFAULT_CAPACITY
  end
end
