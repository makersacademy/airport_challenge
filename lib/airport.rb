require_relative "weather"
require_relative "plane"

class Airport

    attr_reader :planes
    attr_reader :capacity

    DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity

  end

  def plane_landed(plane_name)
    raise "This airport is full to capacity, please go to the next nearest airport to land" if full?
    raise "There is a storm at destination please divert to nearest airport" if stormy?
    @planes << plane_name

  end

  def taken_off
     raise "All planes are grounded until further notice due to bad weather" if stormy?
     @planes.pop
  end

  def stormy?
    Weather.stormy?
  end

private

  def full?
    @planes.count >= @capacity
  end



end
