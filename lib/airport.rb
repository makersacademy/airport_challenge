require_relative 'plane'
require_relative 'weather'

class Airport

  MAX_CAPACITY = 20

  def initialize capacity=MAX_CAPACITY
    @capacity = capacity
    @planes = []
    @today = Weather.new
    land Plane.new
  end

  def land plane
    return 'Unable to land due to bad weather' if stormy?
    return 'Unable to land as airport is full' if full?
    plane.flying = false
    planes << plane
  end

  def take_off
    return 'Unable to take off due to poor weather' if stormy?
    return 'There is no plane here!' if empty?
    planes.last.flying = true
    planes.pop
  end

  def landed_planes
    planes.count
  end

  private

  attr_reader :planes, :today, :capacity

  def stormy?
    today.stormy?
  end

  def full?
    planes.length >= capacity
  end

  def empty?
    planes.empty?
  end

end
