require_relative 'plane'
require_relative 'weather'


class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane, weather)
    fail 'airport is full' if full?
    fail 'plane already grounded' if plane.instance_variable_get(:@in_air) == false
    fail 'cannot land: stormy weather' if weather.instance_variable_get(:@stormy) == true
    @planes << plane  #change in_air status to false
  end

  def take_off(plane, weather)
    fail 'cannot take-off: stormy weather' if weather.instance_variable_get(:@stormy) == true
    fail 'plane not grounded' if plane.instance_variable_get(:@in_air) == true
    @planes.pop
  end

  def full?
    @planes.count >= @capacity
  end

end
