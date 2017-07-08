require_relative 'weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 50
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Negative. Cancel landing due to weather conditions.' if stormy?
    add plane
  end

  def takeoff(plane)
    raise 'Negative. Cancel take-off due to weather conditions.' if stormy?
    remove plane
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def add(plane)
    raise 'Negative. Airport is full.' if full?
    @planes << plane
  end

  def remove(plane)
    raise 'Error. Plane not found.' unless @planes.include? plane
    @planes.delete(plane)
  end
end
