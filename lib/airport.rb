
class Airport
  attr_reader :terminal, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @terminal = []
  end

  def land(plane)
    raise "No landing when stormy" unless good_weather?
    raise "No landing when airport is full" if full?
    raise "Plane already landed" if plane.landed
    plane.land
    @terminal << plane
    @terminal.last
  end

  def take_off(plane)
    raise "No takeoff when stormy" unless good_weather?
    plane.take_off
    @terminal.pop
  end

  def good_weather?
    rand(100) >= 20 ? true : false
  end

private

  def full?
    @terminal.count >= @capacity
  end
end
