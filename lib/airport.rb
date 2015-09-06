require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  include Weather

  DEFAULT_CAPACITY = 100

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def plane_take_off(plane)
    fail 'Cannot currently take off' if empty? || stormy?
    planes.delete(plane)
    plane.take_off
    plane
  end

  def plane_land(plane)
    fail 'Plane cannot currently land at airport' if full? || stormy?
    plane.land
    planes << plane
  end

  private

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end
end
