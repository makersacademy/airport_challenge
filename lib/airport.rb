require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10
  attr_accessor :capacity # sorry Roi

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane, weather)
    fail 'Unable to land. Weather is stormy.' if weather == true
    fail 'Airport at capacity.' if full?
    plane.land
    @planes.push(plane)
  end

  def takeoff(plane, weather)
    fail 'Unable to takeoff. Weather is stormy.' if weather == true
    plane.takeoff
    @planes.pop
  end


  private

  attr_reader :plane

  def full?
    @planes.count >= capacity
  end


end
