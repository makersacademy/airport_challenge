require_relative 'weather_module'

class Airport

  include Weather

# airport set up
  attr_reader :hangar
  attr_accessor :capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

# departing airport

  def take_off(plane)
    fail "Take off prohibited in stormy conditions." if storm?
    fail "Plane is not present in hangar at this airport" unless @hangar.include?(plane)

    @hangar.delete(plane)
  end

  def at_airport?(plane)
    @hangar.include?(plane)
  end

# landing at aiport

  def land(plane)
    fail "Landing prohibited. Airport hangar is at capacity." if full?
    fail "Landing prohibited in stormy conditions." if storm?
    fail "Plane has already landed at this airport" if @hangar.include?(plane)

    @hangar << plane
  end

# testing airport hangar capacity

  def full?
    @hangar.length >= @capacity
  end

# weather

  def storm?
    generate_storm
  end

end
