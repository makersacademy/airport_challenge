require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def planes
    @planes
  end

  def land(plane, weather)
    fail 'Unable to land. Weather is stormy.' if weather == true
    fail 'Airport at capacity.' if full?
    fail 'Plane has already landed.' if plane.landed?
    plane.land
    @planes.push(plane)
  end

  def takeoff(plane, weather)
    fail 'Unable to takeoff. Weather is stormy.' if weather == true
    fail 'Plane has already taken off.' unless plane.landed?
    plane.takeoff
    @planes.pop
  end


  private
  attr_reader :plane

  def full?
    @planes.count >= capacity
  end


end
