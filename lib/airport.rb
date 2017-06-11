
class Airport
  attr_reader :terminal, :capacity

  def initialize(capacity = 10)
    @capacity = capacity
    @terminal = []
  end

  def land(plane)
    raise "No landing when stormy" unless good_weather?
    raise "No landing when airport is full" if full?
    @terminal << plane
  end

  def take_off(plane)
    raise "No takeoff when stormy" unless good_weather?
    plane.took_off
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
