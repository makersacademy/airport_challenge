require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes
  attr_reader :capacity
  attr_reader :weather

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def instruct_land(plane)
    fail "Airport full." if full?
    fail "Storm." if weather.storm?
    if plane.landed? == false
      plane.land
      @planes << plane
      plane
    else
      "Plane has landed."
    end
  end

  def instruct_takeoff
    fail "Airport empty." if empty?
    fail "Storm." if weather.storm?
    if plane.landed? == true
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

end
