require_relative 'plane'
require_relative 'weather'

class Airport

  MAX_CAPACITY = 20

  def initialize capacity=MAX_CAPACITY
    @capacity = capacity
    @planes = []
    @today = Weather.new
  end

  def land plane
    fail 'Unable to land due to bad weather' if stormy?
    fail 'Unable to land as airport is full' if full?
    plane.flying = false
    planes << plane
  end

  def take_off
    fail 'Unable to take off due to poor weather' if stormy?
    fail 'There are no planes in this airport' if empty?
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
