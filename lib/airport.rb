require_relative 'weather'
require './lib/plane'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @planes = []
  end

  def plane_count
    @planes.count
  end

  def land(plane)
    fail 'Planes cannot land: airport full' if full?
    plane.land?
    @planes << plane
  end

  def take_off(plane)
    fail 'Planes cannot take off: airport empty' if empty?
    plane.take_off?
    @planes.delete(plane)
  end

  def full?
    plane_count == @capacity
  end

  def empty?
    plane_count.zero?
  end
end
