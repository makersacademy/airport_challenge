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

    # will not allow plane to land in bad weather if it is flying
    fail 'No landing: Bad weather!' if stormy? && plane.flying == true 

    # will not allow plane to land if it has already landed
    fail 'Plane has already landed' if plane.flying == false 

    # will not allow plane to land if airport is at capacity
    fail 'Airport full' if full?

    # changes 'flying' status to false
    plane.landed
    # adds plane to airport 
    @planes << plane
  end

  def takeoff(plane)

    # will not allow plane to take off in bad weather if it is landed
    fail 'No taking off: Bad weather!' if stormy? && plane.flying == false 

    # will not allow plane to take off if it has already taken off
    fail 'Plane is already flying' if plane.flying == true 

    fail "Plane is in another airport" unless @planes.include? plane 

    # changes 'flying' status to true
    plane.taken_off
    # removes plane from airport
    @planes.pop
    
  end

  private

  attr_reader :weather

  def stormy?
    # generates weather condition
    Weather.new.weather
  end

  def full?
    @planes.count >= @capacity
  end
end
