require_relative 'weather'
require_relative 'plane'

class Airport
include Weather

DEFAULT_CAPACITY = 25

attr_reader :capacity, :all_planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @all_planes = []
  end

  def land(plane)
    fail 'Airport full: no landing' if full?
    fail 'Stormy weather: no landing' if stormy?
    @all_planes << plane
  end

  def take_off
    fail 'Stormy weather: no take-off' if stormy?
    @all_planes.pop
  end

private
attr_reader :plane

  def full?
    @all_planes.count >= capacity
  end

end
