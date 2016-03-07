require_relative 'plane'

class Airport

  attr_reader :planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_land(plane)
    fail "Airport full." if full?
    fail "Storm." if storm?
    unless plane.landed?
      plane.land
      @planes << plane
      plane
    else
      "Plane has landed."
    end
  end

  def instruct_takeoff(plane)
    fail "Airport empty." if empty?
    fail "Storm." if storm?
    fail "That plane isn't in that airport." if plane_in_airport(plane) == false
    if plane.landed?
      plane.takeoff
      plane = @planes.pop
      @planes.delete(plane)
    else
      "Plane has taken off."
    end
  end

  private

  def full?
    @planes.size >= @capacity
  end

  def empty?
    @planes.empty?
  end

  def storm?
    rand(100) >= 90
  end

  def plane_in_airport(plane)
    planes.include?(plane)
  end

end
