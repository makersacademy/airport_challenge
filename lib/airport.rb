require_relative 'weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 50
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def landing_clear?
    raise 'Negative. Cancel landing because of the weather.' if stormy?
    raise 'Negative. Airport is full.' if full?
    true
  end

  def takeoff_clear?
    raise 'Negative. Cancel take-off because of the weather.' if stormy?
    true
  end

  def plane_arrived(plane)
    add(plane)
  end

  def plane_left(plane)
    remove(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def add(plane)
    @planes << plane
  end

  def remove(plane)
    @planes.delete(plane)
  end
end
