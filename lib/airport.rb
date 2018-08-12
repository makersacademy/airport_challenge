require_relative './weather'

class Airport

  include Weather # supplies #stormy?

  attr_reader :planes_on_ground, :capacity

  DEFAULT_CAPACITY = 8

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_on_ground = []
    @capacity = capacity
  end

  def land(plane)
    fail 'not an identifiable plane' if plane.class != Plane
    fail 'plane is already in the airport' if at_airport?(plane)
    fail 'landing denied, airport full' if @planes_on_ground.count >= @capacity
    fail 'landing denied, weather is stormy' if stormy? == true
    @planes_on_ground << plane
  end

  def take_off(plane)
    fail 'plane is not currently at this airport' unless at_airport?(plane)
    fail 'weather is stormy, plane can not take off' if stormy? == true
    @planes_on_ground.delete(plane)
  end

  private
  def at_airport?(plane)
    @planes_on_ground.include?(plane)
  end

end
