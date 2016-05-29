require_relative 'plane.rb'
require_relative 'weather.rb'


class Airport

attr_accessor :capacity, :planes

DEFAULT_CAPACITY = 100


def initialize(capacity=DEFAULT_CAPACITY)
  @capacity = capacity
  @planes = []
end


  def land(plane)
    raise "Impossible to land" if stormy?
    raise "Airport full" if full?
    planes << plane
  end

  def take_off(plane)
    raise "Impossible to take off" if stormy?
    raise "Airport empty" if empty?
    @planes.delete(plane)
  end

private

  def stormy?
    Weather.new.check_storm
  end

  def full?
    planes.length >= DEFAULT_CAPACITY
  end

  def empty?
    planes.length == 0
  end

end
