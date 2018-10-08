require 'plane.rb'
require 'weather.rb'

class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :landed_planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end

  def land(plane, weather)
    raise "Plane has already landed" unless plane.flying?
    raise "Cannot land, Weather is stormy" if weather.stormy?
    raise "Airport is full" if full?
    plane.landed
    @landed_planes.push(plane)
  end

  def takeoff(plane, weather)
    raise "Plane has already takenoff" if plane.flying?
    raise "Cannot takeoff, Weather is stormy" if weather.stormy?
    raise "No planes available" if empty?
    plane.takenoff
    @landed_planes.delete(plane)

  end
end

private

def full?
  @landed_planes.count >= capacity
end

def empty?
  @landed_planes.empty?
end
