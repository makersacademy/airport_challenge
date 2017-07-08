require_relative 'weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 50
  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Error. This plane is not in flight, we can\'t land it." unless plane.in_flight?
    raise 'Negative. Cancel landing because of the weather.' if stormy?
    add plane
  end

  def takeoff(plane)
    raise "Error. This plane is in flight therefore can\'t take-off." unless plane.landed_at?(self)
    raise 'Negative. Cancel take-off because of the weather.' if stormy?
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
    @planes.delete(plane)
  end
end
