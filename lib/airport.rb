require_relative 'plane'
# require_relative 'weather'

class Airport
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 10
  DEFAULT_WEATHER = "fair"

  def initialize(capacity = DEFAULT_CAPACITY, weather = DEFAULT_WEATHER)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Landing not allowed due to bad weather" if weather != "fair"
    fail "Plane cannot land; airport is full" if airport_full?
    @planes << plane
  end

  def takeoff(plane)
    fail "Takeoff not allowed due to bad weather" if weather != "fair"
    @planes.pop
    "Successful takeoff!"
  end

  def airport_full?
    planes.length >= capacity
  end 
end
