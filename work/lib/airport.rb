require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :plane
  ::DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'No landing: Bad weather!' if stormy? &&  plane.flying == true 

    raise 'Plane has already landed' if plane.flying == false 

    raise 'Airport full' if full?

    plane.landed
    @planes << plane
  end

  def takeoff(plane)
    raise 'No taking off: Bad weather!' if stormy? &&  plane.flying == false 

    raise 'Plane is already flying' if plane.flying == true 

    plane.taken_off
    @planes.pop
   
  end

  private

  def stormy?
    Weather.new.weather
  end

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end
end
