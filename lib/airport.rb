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
    if weather.stormy?
      "Cannot land, Weather is stormy"
    elsif full?
      raise "Airport is full"
    else
      @landed_planes.push(plane)
    end
  end

  def takeoff(plane, weather)
    if weather.stormy?
      "Cannot takeoff, Weather is stormy"
    elsif empty?
      raise "No planes available"
    else
      @landed_planes.delete(plane)
      "Plane has taken off"
    end
  end
end

private

def full?
  @landed_planes.count >= @capacity
end

def empty?
  @landed_planes.empty?
end
