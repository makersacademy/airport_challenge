require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize
    @planes = []
    set_capacity
  end

  def land(plane, weather)
    raise "Too stormy to land planes!" if weather.stormy?
    raise "The airport is full!" if @planes.length >= 20
    @planes << plane
  end

  def takeoff(plane, weather)
    raise "Too stormy to let planes takeoff!" if weather.stormy?
    planes.delete(plane)
  end

  def planes_in_airport
    @planes.dup
  end

  def set_capacity(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
  end


private

  attr_reader :planes

end
